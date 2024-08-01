package com.agile.flight.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CustomRouteRepositoryImpl implements CustomRouteRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Long generateRouteId() {
        Query query = entityManager.createQuery("SELECT COALESCE(MAX(r.routeId), 100) + 1 FROM Route r");
        return (Long) query.getSingleResult();
    }
}
