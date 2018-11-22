From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v6 05/11] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Thu, 22 Nov 2018 20:04:53 +0100
Message-ID: <20181122190453.GA6260@mail-itl>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-6-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0979876242624809794=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HDGj=OB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gPuHg-0003EM-Ve
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 19:05:05 +0000
In-Reply-To: <20181112164930.25893-6-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0979876242624809794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2018 at 04:49:24PM +0000, Anthony PERARD wrote:
(...)
> +/* QMP FD callbacks */
> +
> +static void qmp_ev_fd_callback(libxl__egc *egc, libxl__ev_fd *ev_fd,
> +                               int fd, short events, short revents)
> +{
> +    EGC_GC;
> +    int rc;
> +    libxl__json_object *o =3D NULL;
> +    libxl__ev_qmp *ev =3D CONTAINER_OF(ev_fd, *ev, qmp_efd);
> +
> +    if (revents & (POLLHUP)) {
> +        LOGD(ERROR, ev->domid, "received POLLHUP from QMP socket");
> +        rc =3D ERROR_PROTOCOL_ERROR_QMP;
> +        goto out;
> +    }
> +    if (revents & ~(POLLIN|POLLOUT)) {
> +        LOGD(ERROR, ev->domid,
> +             "unexpected poll event 0x%x on QMP socket (expected POLLIN "
> +             "and/or POLLOUT)",
> +            revents);
> +        rc =3D ERROR_FAIL;
> +        goto out;
> +    }
> +
> +    if (revents & POLLOUT) {
> +        rc =3D qmp_ev_callback_writable(gc, ev, fd);
> +        if (rc)
> +            goto out;
> +    }
> +
> +    if (revents & POLLIN) {
> +        rc =3D qmp_ev_callback_readable(egc, ev, fd);
> +        if (rc)
> +            goto out;
> +
> +        /* parse input */
> +        while (1) {
> +            /* parse rx buffer to find one json object */
> +            rc =3D qmp_ev_get_next_msg(egc, ev, &o);
> +            if (rc =3D=3D ERROR_NOTFOUND) {
> +                rc =3D 0;
> +                break;
> +            } else if (rc)
> +                goto out;
> +
> +            /* Must be last and return when the user callback is called =
*/
> +            rc =3D qmp_ev_handle_message(egc, ev, o);
> +            if (rc < 0)
> +                goto out;
> +            if (rc =3D=3D 1) {
> +                /* user callback has been called */
> +                return;
> +            }
> +        }
> +    }
> +
> +    qmp_ev_ensure_reading_writing(gc, ev);
> +
> +out:
> +    if (rc) {
> +        LOGD(ERROR, ev->domid,
> +             "Error happend with the QMP connection to QEMU");
> +
> +        /* On error, deallocate all private ressources */
> +        libxl__ev_qmp_dispose(gc, ev);
> +
> +        /* And tell libxl__ev_qmp user about the error */
> +        ev->callback(egc, ev, NULL, rc); /* must be last */
> +    }
> +}
> +
(...)
> +static int qmp_ev_callback_readable(libxl__egc *egc,
> +                                    libxl__ev_qmp *ev, int fd)
> +{
> +    EGC_GC;
> +
> +    while (1) {
> +        ssize_t r;
> +
> +        /* Check if the buffer still have space, or increase size */
> +        if (ev->rx_buf_size - ev->rx_buf_used < QMP_RECEIVE_BUFFER_SIZE)=
 {
> +            ev->rx_buf_size =3D max(ev->rx_buf_size * 2,
> +                               (size_t)QMP_RECEIVE_BUFFER_SIZE * 2);
> +            assert(ev->rx_buf_size <=3D QMP_MAX_SIZE_RX_BUF);
> +            if (ev->rx_buf_size > QMP_MAX_SIZE_RX_BUF) {
> +                LOGD(ERROR, ev->domid,
> +                     "QMP receive buffer is too big (%ld > %lld)",
> +                     ev->rx_buf_size, QMP_MAX_SIZE_RX_BUF);
> +                return ERROR_BUFFERFULL;

What if you receive multiple messages (events?), but actually a single
message do fit in a buffer? I think it would be better to stop receiving
the data in the case of buffer full, but try to find a valid message
before erroring out.

> +            }
> +            ev->rx_buf =3D libxl__realloc(NOGC, ev->rx_buf, ev->rx_buf_s=
ize);
> +        }
> +
> +        r =3D read(fd, ev->rx_buf + ev->rx_buf_used,
> +                 ev->rx_buf_size - ev->rx_buf_used);
> +        if (r < 0) {
> +            if (errno =3D=3D EINTR) {
> +                continue;
> +            }
> +            if (errno =3D=3D EWOULDBLOCK) {
> +                break;
> +            }
> +            LOGED(ERROR, ev->domid, "error reading QMP socket");
> +            return ERROR_FAIL;
> +        }
> +
> +        if (r =3D=3D 0) {
> +            LOGD(ERROR, ev->domid, "Unexpected EOF on QMP socket");
> +            return ERROR_PROTOCOL_ERROR_QMP;
> +        }
> +
> +        LOG_QMP("received %ldB: '%.*s'", r,
> +                (int)r, ev->rx_buf + ev->rx_buf_used);
> +
> +        ev->rx_buf_used +=3D r;
> +        assert(ev->rx_buf_used <=3D ev->rx_buf_size);
> +    }
> +
> +    return 0;
> +}

(...)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlv2/dgACgkQ24/THMrX
1yyQBwf/UINYy5C3lxq+sMsGUoY5symwPZ42+BUoPAPsGkdBQxz+aJCBsf33NKzf
rJqXqlKOw236ONrqjWN0GK5JYKIafl6UZJHJ+StE0AuZO8h8sy7ssnf1eG6+CN71
DgurthpHBOssNaUEU3JxaS3WyIZn9SI8LFdTOZ+d5BuB9ErHUBEiQxAxpbgDG9iQ
eXbA2tmagQ7cg9grWyGAeUZlCMX3Eidyp+ZdEkH4Euj8KtY0/jjVyCCLp0c8kn+a
rY1RLxvo74oOOplL/L0rQhj/WyER6CyMJaUmd9ormnbxniKzhmT9koYkO7gq1b1l
H5dXAU7boR+5V7m0/mr805iU6YeWWQ==
=hY4f
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--


--===============0979876242624809794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0979876242624809794==--
