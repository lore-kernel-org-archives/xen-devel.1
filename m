Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852C4CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 10:03:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439005.1657526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCa6Y-0000wh-4N; Fri, 02 Oct 2026 10:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439005.1657526; Fri, 02 Oct 2026 10:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCa6Y-0000wa-1m; Fri, 02 Oct 2026 10:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1439005;
 Fri, 02 Oct 2026 10:03:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mer.r4him@gmail.com>) id 1xCa6W-0000wP-T0
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:03:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCa6W-00HCGf-5u
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 12:03:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mer.r4him@gmail.com>)
 id 6abf814b-bab6-0a2a0a5309dd-0a2a4508959e-36
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:02:59 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mer.r4him@gmail.com>)
 id 6abf8153-f659-0a2a45080019-4a7de44c99c0-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:02:59 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a996c8adf3so12001024a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 03:02:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790935379; cv=none;
        d=google.com; s=arc-20260327;
        b=NBrNJT3SNylVyPmgyyFf7sNZ2XEo+2r9h+BlGsA9xcJ5grxNOI12n2u1yj4WfnFDIa
         FbqLWlBORIvAsvHEsfLA8l5STTP1WuVfFg3AqTcX7eHWM85FYmyiYxl+HsHoozDONZOI
         qNTvE+6OGHnOmXWy2xP+FPqbzVCV4E7kv5/FB8vdf+dq+r/4olOs97MH/2Tn6EBf9L3o
         Yzxt+UFxVSZ9GF1IKDPquQsycoFulK5G+gMP9/Cpj29zS5+L/+cxxqhklF5NoQacm+2n
         DOdz2lVv7RmnI/gY6DMK+Mv8e9gW8E0XCJ9rSev+U+d0bgEUGhOse1oiaE5a2ybLufnx
         P45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4ZPz+Sdy14wB6XVIc9+haG6Un5+fqxeMpVNAIkEEEwo=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=JLC1ryh1Dot0h8SCir2/eqol4HIufTyG1vJRPlEW/CatpSQX7BbWofYB2Eab87gZ2i
         B0Wp3YgXd1+mxcWiADq7dj8inEb35GGK8PSDPuQA1vtwoBK7r9ZqhK6QiYQKZFMfehSz
         wCFB1gmgWtYl5RpKrwS+g00UQuWYT41G8INjBNJdxiNR9ciIUvfBVgRucS6WXXJ/2Y2F
         WbwIWLV3pOGQFg9twY0b0PZT49/Z7ev9YXau5ZNi6Cw2Xo0k5pnu8r9QoGlX97HQHVv9
         zVdFrUFo6O6Tw1veyuEK2f4y6QPyapgTs+gXKP0tM4SlTKnuBuJ3dJYdFTzMIWzE9ZCk
         9p8Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935379; x=1791540179; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4ZPz+Sdy14wB6XVIc9+haG6Un5+fqxeMpVNAIkEEEwo=;
        b=iK72REeDqaI1pVxwqaire/HXf2KaxLu1Txkia7vpINgs8bXL4zi3vvIc+IlFSsVCab
         aO1Yu2U5UpZ5eOQrK8yGxbD9QUus0+IMedKewmucns/UuDalC6XKgyYz6/E4TXfbL2lW
         MaEw9owKm5S3BiH+oBTSgXTVt36yKf5NezGlGBbOVvDFKMggQ59fGA/xOha8fIYHV+o2
         aPfw//6Y+yP6WQurMDxWJIw2ZQs4pQ+CVfeP0wKv+uKvqkORVGUi9ZgaWOAGr/iJDNIG
         7j1dPgyzTR382JVLG4NQGIUwP/di3AlLC8X3RAZKlm83eC5Jpw3659B+7pStd1tgSMFm
         rFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935379; x=1791540179;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZPz+Sdy14wB6XVIc9+haG6Un5+fqxeMpVNAIkEEEwo=;
        b=I1FToL8PyDoNcrBxkFtY7+S4r3I8OjKvDAND+O+MfVkBzdj+p7hzN8hZqOHGnUc8jB
         BlvsQOdaJRxBVIGNFXnci+YuPvFDcVGV/F60e8sjwKL9GYsKLdAleRvwNF8ThPBp4AzD
         p9NSkeHDI9g/H3kTyynD+na+qT50WGb5AlzS97krTSvNYqo1fNzHMIVPflKpvtdQ5eQJ
         hWsiNU1XLgLGndeQDdxNw7bPEOpJC1KHyPlpPeUFe7/IvsI311J5Oss1Wd108S1dX5SC
         FALoC1TOoOCJplQWPluntXV6T7h0gLEtNL3Rw/TONrPYTjAyJBveO+byTuuhLodHbP7u
         b1Pg==
X-Gm-Message-State: AFq9FYKPKQB0qL11YP3ZwyteHVq6jnmlt7Eu6kwEcR+KF7hT6z2YZvbE
	1JWahK0zbo03Ln20tBXkVbgeBNRBKS79nnayIs5vqaAeP3+yHMn4tTe5kI7Bt6vAnwJqMNvkI7Y
	+Rx65siuwt82gU93bpXGQ06uQ0LGsCbVYLIq0
X-Gm-Gg: AYBFou1IT/XLEul1dvYLZbBTssg8da1NeJ7aYXGJOz2Gh5adbvNmF1N2P9zF21Nss/c
	TdSmzkWjPhZamN989wa7z2UdULbobn21bpCZe5M5l4SoMIR1eJ5X73oFYHWo43tju9So22muR9q
	xkfgW4xKzexOuGKXWqF5NW43CgioWRmSyAmitMObK8/OlAXFdFXAGhg6EfE8axZ+Rthm8VnMVrW
	qnqofcoP1KvT53q2JsrA8OkG1KutFmzA29z3GLAxkOIp/G2X5S2rlKL+Vgm04aICAgjBQcD09mZ
	pGuUsW0GKgz/+5Z9NZc3O5rNVWqWrsK+qYZ1WFElkcigVM8uj2zGPPtR
X-Received: by 2002:a05:6402:27c9:b0:6ab:6f77:c4eb with SMTP id
 4fb4d7f45d1cf-6af9e362590mr1285805a12.37.1790935378838; Fri, 02 Oct 2026
 03:02:58 -0700 (PDT)
MIME-Version: 1.0
From: r4ahim <mer.r4him@gmail.com>
Date: Fri, 2 Oct 2026 11:02:47 +0100
X-Gm-Features: AclHuK8HG6fcKIeNFISIhkcGtsb6H2SFfm7QtoC5Fc56lgVcIh8avYnH1fD8S5o
Message-ID: <CALHzv=K_wH2O2hV+X8PtB8USX4kdFO3GTh7L93r_4rXyx+VcqQ@mail.gmail.com>
Subject: Newcomer looking for a small first task
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1790935379-CD34D87B-D1021705/0/0
X-purgate-type: clean
X-purgate-size: 331

Hi,

I'm new to Xen, running it under QEMU (Xen builds and Dom0
boots). I'm preparing my first patch and I'm most interested in
PCI passthrough, vPCI and the IOMMU, but I'm happy to start
anywhere.

Is there a small unclaimed item (a MISRA violation, docs fix or
XTF test) that I could take?

Thanks,
Abderrahim Meriah

