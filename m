Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F829CA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:46:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442501.1660066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqw-00049q-C5; Wed, 07 Oct 2026 15:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442501.1660066; Wed, 07 Oct 2026 15:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqw-00047r-4G; Wed, 07 Oct 2026 15:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1442501;
 Wed, 07 Oct 2026 15:46:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b955a0003f66@swg.vates.tech>)
 id 1xETqu-0003yI-I0
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:46:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xETqt-0022WU-Ja
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b955a0003f66@swg.vates.tech>)
 id 6ac66961-8faa-0a2a0a5109dd-0a2a450ba5ac-18
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b955a0003f66@swg.vates.tech>)
 id 6ac66960-b7e8-0a2a450b0019-b9ff1c22902f-6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1170b955a0003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:46:37 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 02C3981DEB;
 Wed,  7 Oct 2026 17:46:36 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=rSN6u6bHZ5QzzlBfugU+xcXP+4p5XrIY6NkPSwW+1mc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ru48aYnryweRttAV4ItK1qPCdEA7fsKwVIIC9fdkX4/UCQDRlyF9s07SqZQ4N5f4XtmnTPI+h
 rGtdXcTRKCkUHihfLsz5tpe1ZTDkVkt47clwy3oh1AuPMjH2u40ksYyhWDKCbVX74QmLqJc5SIO
 9tIcR+MOrUcHItbfXpZ658QfgqUlOqFtA4PuvU3XLkhUQvcArxP+oT8IA7N14iCch5p1WG+3U65
 IAMgUdqnnnwbjvjmSwhf2WV3x7HuuVqtmtnBrxDCmUjS4SAQ9jCxENt3v6J6Mj1dQwgrqwQRO4j
 o8A/y/zJBum4FlZ/fenH9vrh9mM56BlHMMKkWBywjM8Q==
X-Zone-Loop: 6a1f2c71f598e007e75589bcf340be281a20a2d186d8
x-campaign-type: default
x-transaction-id: 307586ce-98bb-4d77-8c0b-05028f079274
x-swg-uid: 01-405f1bfa-6df0-465f-9ad1-1120048dbaa4
X-Mailer: Sweego
Message-ID:
 <1791387997.8631fc262581453bbf619ec5b2062170.1a1170b955a0003f66@vates.tech>
x-swg-bid: 1791387997.8631fc262581453bbf619ec5b2062170.1a1170b955a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 4/4] xenpm: Rework get-core-temp around CPU status map and topology
Date: Wed,  7 Oct 2026 17:46:06 +0200
In-Reply-To: <20261007154607.119543-2-teddy.astie@vates.tech>
References: <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
 <20261007154607.119543-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.705.73c0cff9a55a1186.1a1170b93aa.fe6734302212fccf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791387997098
X-purgate-ID: tlsNG-42698a/1791388003-A96C29EA-1BCFC72A/0/0
X-purgate-type: clean
X-purgate-size: 4973

---=Part.705.73c0cff9a55a1186.1a1170b93aa.fe6734302212fccf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Current get-core-temp core selection logic has some corner cases,
in particular when CPUs are offlined=2E

When some CPUs are offline, we observe various issues :
 - XENPF_resource_op fails with ENODEV on offline CPUs
 - cores_per_socket can be incorrect if there are offline CPUs on
   the first socket, leading to incorrect socket count calculation

Rather than trying to workaround the problem, rework the algorithm to
check if the CPU is online using XEN_SYSCTL_get_cpu_status_map and
use CPU topology to select CPU sockets in a more robust way=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
I'm not happy with the way sockets are handled=2E Using a bitmap
would be a better option, but it would make things more complicated
than it already is=2E

 tools/misc/xenpm=2Ec | 67 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/tools/misc/xenpm=2Ec b/tools/misc/xenpm=2Ec
index ecb39c911d=2E=2Ef6d1241496 100644
--- a/tools/misc/xenpm=2Ec
+++ b/tools/misc/xenpm=2Ec
@@ -1419,9 +1419,11 @@ static int fetch_dts_temp(xc_interface *xch, uint32=
_t cpu, bool package, int *te
=20
 static void get_core_temp(int argc, char *argv[])
 {
-    int temp =3D -1, cpu =3D -1;
-    unsigned int socket;
+    int temp =3D -1, cpu =3D -1, socket =3D -1;
     bool has_data =3D false;
+    xc_cputopo_t *cputopo =3D NULL;
+    unsigned int max_cpus =3D max_cpu_nr;
+    xc_cpumap_t cpu_online_map =3D NULL;
=20
     if ( argc > 0 )
         parse_cpuid(argv[0], &cpu);
@@ -1439,25 +1441,72 @@ static void get_core_temp(int argc, char *argv[])
         return;
     }
=20
+    cputopo =3D calloc(max_cpu_nr, sizeof(*cputopo));
+    if ( !cputopo )
+    {
+        fprintf(stderr, "Unable to allocate CPU topology list\n");
+        goto out;
+    }
+
+    cpu_online_map =3D xc_cpumap_alloc(xc_handle);
+    if ( !cpu_online_map )
+    {
+        fprintf(stderr, "Unable to allocate CPU status bitmap\n");
+        goto out;
+    }
+
+    if ( xc_cputopoinfo(xc_handle, &max_cpus, cputopo) )
+    {
+        fprintf(stderr,
+                "Unable to get CPU topology (%d - %s)\n",
+                errno, strerror(errno));
+        goto out;
+    }
+
+    if ( (xc_get_cpu_status_map(xc_handle, max_cpu_nr, cpu_online_map,
+                                     NULL, NULL)) )
+    {
+        fprintf(stderr, "Unable to get CPU online map (%d - %s)\n",
+                errno, strerror(errno));
+        /* Assume all populated */
+        memset(cpu_online_map, 0xff, xc_get_cpumap_size(xc_handle));
+    }
+
+    if ( max_cpus > max_cpu_nr )
+    {
+        fprintf(stderr, "xc_cputopoinfo returned more CPU than physinfo ?=
\n");
+        max_cpus =3D max_cpu_nr;
+    }
+
     /* Per socket measurement */
-    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
-          socket++, cpu +=3D physinfo=2Ecores_per_socket * physinfo=2Ethr=
eads_per_core )
+    for ( cpu =3D 0; cpu < max_cpus; cpu++ )
     {
+        if ( !xc_cpumap_testcpu(cpu, cpu_online_map) ||
+             cputopo->core =3D=3D XEN_INVALID_CORE_ID ||
+             (int)(cputopo[cpu]=2Esocket) <=3D socket )
+            continue;
+
+        socket =3D cputopo[cpu]=2Esocket;
+
         if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )
         {
             fprintf(stderr,
                     "[Package%u] Unable to fetch temperature (%d - %s)\n"=
,
-                    cpu, errno, strerror(errno));
+                    socket, errno, strerror(errno));
             /* CPU may not support package temperatures, but still suppor=
t DTS */
             break;
         }
=20
         has_data =3D true;
-        printf("Package%u: %d=C2=B0C\n", socket, temp);
+        printf("Package%d: %d=C2=B0C\n", socket, temp);
     }
=20
-    for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo=2Ethreads_per_co=
re )
+    for ( cpu =3D 0; cpu < max_cpus; cpu +=3D physinfo=2Ethreads_per_core=
 )
     {
+        if ( !xc_cpumap_testcpu(cpu, cpu_online_map) ||
+             cputopo[cpu]=2Ecore =3D=3D XEN_INVALID_CORE_ID )
+            continue;
+
         if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
         {
             fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - %s=
)\n",
@@ -1469,6 +1518,10 @@ static void get_core_temp(int argc, char *argv[])
         printf("CPU%d: %d=C2=B0C\n", cpu, temp);
     }
=20
+out:
+    free(cputopo);
+    free(cpu_online_map);
+
     if ( !has_data )
         exit(EXIT_FAILURE);
 }
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.705.73c0cff9a55a1186.1a1170b93aa.fe6734302212fccf=---

