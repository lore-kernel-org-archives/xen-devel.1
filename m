Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55D606A32F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ctLKwhtX
Received: from list by lists.xenproject.org with outflank-mailman.1494080.1693760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbbP-00043a-SD; Wed, 18 Nov 2026 09:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494080.1693760; Wed, 18 Nov 2026 09:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbbP-00043T-NV; Wed, 18 Nov 2026 09:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1494080;
 Wed, 18 Nov 2026 09:05:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ede71fe40006d3f@swg.vates.tech>)
 id 1xTbbN-00043N-Jp
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbbM-000SJb-OX
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:05:12 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ede71fe40006d3f@swg.vates.tech>)
 id 6afd6a3d-8faa-0a2a0a5109dd-0a2a4504b6e2-42
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:05:12 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ede71fe40006d3f@swg.vates.tech>)
 id 6afd6a48-b57f-0a2a45040019-b9ff1c23a0bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:05:12 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ede71fe40006d3f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Nov 2026 09:05:09 +0000
Received: from [192.168.1.14] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C0841804C8;
 Wed, 18 Nov 2026 10:05:08 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=XPCdiU6K1aYORIrfMe/JZDa0ps9KN6GCom3OFGkq+hQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ctLKwhtXv7ALLbpUsn2tOLEBT0AH0pOJi0nBtXd6YQNFXANMbYe8djjxkwQS9NZkIX0rkx5kW
 DTiIGiE4nAM/AuoK4m0rjuBKVOZqI9Dlx9U23ROaiPdov4wDBEpK8Bq8x97UMT07m6DArPtLG5F
 vRfx2whZ/fui8vR0EsqL0/swee6nhBjIr9lHszVLMvSmoviVwsq/tvxqw1L/xIxx4w3FWZilDBw
 7aNq+j6rFQrSuPCpwtLqdlj0GsVRDGB0y403htfxIRufFAifc3k5JJqygj3tqudkV/ekxcklQVp
 gB623QykHbKooJni7HDapkhB5429rH4zVIwai1XVlEcA==
X-Zone-Loop: 8e429bde8223e6968c9b55ec7fc4b6f37b0fa8a1f59c
x-campaign-type: default
x-transaction-id: 468e144a-ae8c-442e-8fa6-315b5772eb01
x-swg-uid: 01-7c6e1bac-2443-4094-aebc-531db406cc53
X-Mailer: Sweego
Message-ID:
 <1794992709.8631fc262581453bbf619ec5b2062170.1a1ede71fe40006d3f@vates.tech>
x-swg-bid: 1794992709.8631fc262581453bbf619ec5b2062170.1a1ede71fe40006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 18 Nov 2026 10:05:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Don't save or load HVM context of a domain with
 no vCPUs
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ccd6c2bb95cfdd80f430aebf62d788c825ae939.1794985346.git.lin.liu01@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7LTBVHV/XO
 Zw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJT4ny+OGntnJntUoR
 KRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJAWicutjkkUgd28Bh6HV9EIumH
 tCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaT
 VqMdqul07o72m3eA2mf+LMu9a04FX/d4wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/
 EoucejoZ5SH49ksmVAmKOLktOaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+S
 PhHar7TPKjFz0G3DPNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89
 MXfQXZ3qt1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
 LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWjmoACGwME
 CwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNzuyOVCskwfUZPla6Z
 pd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp0x0HfuhcYfAYPR46XHTvjaJE
 v99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuROxdK8G+YHccJY8PvWSq2K2yiae2KGiAv
 1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhP
 eP3IdpfWc8cyRLXF06Rk46YMYCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcT
 UwgnYlFRk2FLq0QeKEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9
 Egr/Wmu3MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
 f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEMAKiQiZa3
 yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ3DbVf+en3/FvdVZg
 2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTmetSG5/52AjtmPFtlXAk0NmLv
 fJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0s3109sJeXT5ImVdphFs9cvyZyBT9t1Pb
 Rowv58EgV0zE4hbAeVkULAbxFV5b/ExTjjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKb
 Yu6NCfiHfEyB3Xyg9hfdrRgjMRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ov
 XoK4jm+Py0FiUGUaA6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/
 eVtR2Q1wZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
 IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWjmoACGwwA
 CgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiVoUiHYN5QwhnbZnsa
 JDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764QxyX6rld2f2RcWkDuBHun55ZWXj
 by8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk/dS0XTOQi2wVUb17sW/+ybCEokdVacZG
 zOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fuoGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+
 lOWSvdNHgoEkWR0RXBPQjnGmLKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/Off
 O485NOTKwGOxyWb006cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR
 8ULR9nX0LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <0ccd6c2bb95cfdd80f430aebf62d788c825ae939.1794985346.git.lin.liu01@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.23f.76e42051d0b4066.1a1ede71d14.d703c31f61c67a1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794992708888
X-purgate-ID: tlsNG-ebf023/1794992712-C32CCB50-52C12D42/0/0
X-purgate-type: clean
X-purgate-size: 4176
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.23f.76e42051d0b4066.1a1ede71d14.d703c31f61c67a1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 18/11/2026 =C3=A0 08:06, Lin Liu a =C3=A9crit=C2=A0:
> XEN_DOMCTL_createdomain allocates d->vcpu[] but the vCPUs themselves are
> only created by a later XEN_DOMCTL_max_vcpus=2E  In that window
> XEN_DOMCTL_gethvmcontext{,_partial} on the domain reach the per-domain
> save handlers with d->vcpu[0] =3D=3D NULL=2E  A dom0 tool polling xen-hv=
mctx
> across all domains while a VM was being restored took the host down:
>=20
>    (XEN) HVM d25 save: PIC
>    (XEN) RIP:    e008:[<ffff82d04030dc98>] arch/x86/hvm/vpic=2Ec#vpic_sa=
ve+0x8/0x8f
>    (XEN) rdi: 0000000000000000
>    (XEN) Xen call trace:
>    (XEN)    [<ffff82d04030dc98>] R arch/x86/hvm/vpic=2Ec#vpic_save+0x8/0=
x8f
>    (XEN)    [<ffff82d04021009f>] S arch/x86/hvm/save=2Ec#hvm_save=2Ecold=
+0x9b/0xf7
>    (XEN)    [<ffff82d04036d99c>] S arch_do_domctl+0x1a2c/0x28a6
>    (XEN)    [<ffff82d04025341a>] S do_domctl+0x139a/0x1642
>    (XEN)    [<ffff82d04033331e>] S pv_hypercall+0x3ae/0x59a
>    (XEN)    [<ffff82d0402003b5>] S lstar_enter+0x105/0x10a
>    (XEN)
>    (XEN) Panic on CPU 0:
>    (XEN) FATAL PAGE FAULT
>    (XEN) [error_code=3D0000]
>    (XEN) Faulting linear address: 0000000000000018
>=20
> XEN_DOMCTL_sethvmcontext has the same problem on the load side, e=2Eg=2E
> pit_load() uses d->vcpu[0] for the guest time=2E
>=20
> Refuse to save or load the whole context until vCPU 0 exists, and look u=
p
> the vCPU in hvm_save_one() with domain_vcpu(), failing with -ENOENT as
> for other absent vCPUs=2E
>=20
> Fixes: d0d8980138c4 ("x86/hvm: remove redundant save functions")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lin Liu <lin=2Eliu01@citrix=2Ecom>
> ---
>   xen/arch/x86/hvm/save=2Ec | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/save=2Ec b/xen/arch/x86/hvm/save=2Ec
> index 8ab6405706=2E=2E48f8229061 100644
> --- a/xen/arch/x86/hvm/save=2Ec
> +++ b/xen/arch/x86/hvm/save=2Ec
> @@ -139,12 +139,11 @@ int hvm_save_one(struct domain *d, unsigned int ty=
pecode, unsigned int instance,
>            !hvm_sr_handlers[typecode]=2Esave )
>           return -EINVAL;
>  =20
> -    if ( hvm_sr_handlers[typecode]=2Ekind !=3D HVMSR_PER_VCPU )
> -        v =3D d->vcpu[0];
> -    else if ( instance >=3D d->max_vcpus || !d->vcpu[instance] )
> +    /* Per-domain records are saved via vCPU 0, absent before max_vcpus=
=2E */
> +    v =3D domain_vcpu(d, hvm_sr_handlers[typecode]=2Ekind =3D=3D HVMSR_=
PER_VCPU
> +                       ? instance : 0);
> +    if ( !v )
>           return -ENOENT;
> -    else
> -        v =3D d->vcpu[instance];
>       ctxt=2Esize =3D hvm_sr_handlers[typecode]=2Esize;
>       ctxt=2Edata =3D xmalloc_bytes(ctxt=2Esize);
>       if ( !ctxt=2Edata )
> @@ -203,7 +202,8 @@ int hvm_save(struct domain *d, hvm_domain_context_t =
*h)
>       struct hvm_save_end end;
>       unsigned int i;
>  =20
> -    if ( d->is_dying )
> +    /* Per-domain handlers are passed vCPU 0=2E */
> +    if ( d->is_dying || !d->vcpu[0] )
>           return -EINVAL;
>  =20
>       hdr=2Emagic =3D HVM_FILE_MAGIC;
> @@ -291,7 +291,8 @@ int hvm_load(struct domain *d, bool real, hvm_domain=
_context_t *h)
>       struct hvm_save_descriptor *desc;
>       int rc;
>  =20
> -    if ( d->is_dying )
> +    /* Some per-domain loaders use vCPU 0=2E */
> +    if ( d->is_dying || !d->vcpu[0] )
>           return -EINVAL;
>  =20
>       /* Get at the save header, which must be first */

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>

We probably want to refactor parts of this function to avoid duplication=
=20
(repeated hvm_sr_handlers[typecode], hvm_sr_handlers[typecode]=2Ekind =3D=
=3D=20
HVMSR_PER_VCPU, =2E=2E=2E)=2E But that's better done in a separate patch=
=2E

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.23f.76e42051d0b4066.1a1ede71d14.d703c31f61c67a1=---

