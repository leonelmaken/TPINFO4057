package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Annonces {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idannonce;
    private String title;
    private String description;
    private String fileannonce;
    private String imageannonce;

    @ManyToOne
    private Chefdep chefdep;
    @ManyToOne
    private Dean doyen;
}
