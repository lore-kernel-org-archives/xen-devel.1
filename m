Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B98C282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:04:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FB82087F
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBfPnDUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FB82087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHiAy-0004j4-Ny; Sat, 20 Apr 2019 05:04:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtSH=SW=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHiAy-0004iz-Ae
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 05:04:32 +0000
X-Inumbo-ID: c7d4950a-6329-11e9-92d7-bc764e045a96
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c7d4950a-6329-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 05:04:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j9so9049749wrn.6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2019 22:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GSsB8aip7SpyTmkuGL9zMIE1/OV2xLDEx1T/+cJclTs=;
 b=WBfPnDUOQGVg1Wj0flhsZceatqS1INIdd1ftGUdjmaklLwE0lEAWfKchhlM8vGnZ6D
 VgxDurzmXKZYjZZO7uK9hY362r010D2OooKqlxo/hIZVbCDteikapxmwGuZwXnMigITU
 RNXspWodWJJPKRUyOTrW/lN02IbHyGctRsPfLP5LTbiv8bOw8q6rr1OpJSpmIkKVrKLW
 mqlkqkpdq5DkkSGkjK2Ic7oS+u4jOKDuJ0+0zgIHYAcIwkem49x2/QJbZKRPr/a1b4wm
 tswT9CaZSOD+TMEJzgfPc4lgI5b7BYQjvis2GW6aVfv2MA6g+kJiOKqxmarDgX+CcaMf
 W/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GSsB8aip7SpyTmkuGL9zMIE1/OV2xLDEx1T/+cJclTs=;
 b=D+4b1KVK9k2jijZbwvZcwZtX1DjbgYCf14oSRJ+m5YEM8RHg18lBTUyr+rWJTM5CZ4
 OMv44iZu8CwJ6095B5rQXrA+KG5VObr+L9Q5u+J9AC1ba6E8YFG5ujCy2r5y4Z/u0rVO
 YkvqBnz+N9lOdSHFYsvIENOKaREakrvd68MaFiemh9NTRTfMBRYOQCmQj14HGSKWVRah
 NdSZI8No7r2y7SQJWES1z9qcSzM2JeWkF+C/7FY4sbu9l1oPBrJdptXra+pWvl/hb/9x
 UhqMTBvJxW4jLgdc4dmDEiFbDX4uWM7848auHCYaJ4WfNMdzGhIlRL7FYG9M/ABemwib
 TpJA==
X-Gm-Message-State: APjAAAVcTyML991xf5VNTZMCtQHGzwFT8XE5J4y11M4VbWm6wicKDmJ2
 fb8UyXNs4GpsfgvFVJJsswCusJvXjkZwiNme9aDQfL96hZPvhw==
X-Google-Smtp-Source: APXvYqyrIcz5RHHT0v42rhcBd0gT3Dmv4V0ElttrgOTmy5eAsSFGryD1O1bBSzi+u0VWw1LGvcs42y0ANNWQWMROzg0=
X-Received: by 2002:adf:eb0b:: with SMTP id s11mr5763303wrn.140.1555736670478; 
 Fri, 19 Apr 2019 22:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=fyyChrzXiOkdKGinSHy0NQns4VbNuPiY9DffdDS84=Zw@mail.gmail.com>
In-Reply-To: <CABwOO=fyyChrzXiOkdKGinSHy0NQns4VbNuPiY9DffdDS84=Zw@mail.gmail.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sat, 20 Apr 2019 13:04:18 +0800
Message-ID:
 <CABwOO=edmA74tfueQR3aT3V1N_Wwv4gsgMbQYr6BXNa3ekyL=g@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] tools/Makefile: the qemu-xen-dir-remote directory
 in qemu-xen-dir-force-update target
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420050418.wFmMJfa0jmHEsU9_n6SrMwm8X_hwEuTHujB0gGh7UaU@z>

T24gRnJpLCAxOSBBcHIgMjAxOSBhdCAxNDoxOSwgS2V2aW4gQnVja2xleQo8a2V2aW4uYnVja2xl
eS5lY3MudnV3LmFjLm56QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJIGFtIGxvb2tpbmcgdG8gYnVp
bGQgYSBYZW4gZnJvbSBhIGRvd25sb2FkZWQgc291cmNlIHRyZWUgYXQgY29tbWl0IGNiNzBhMjYK
Pgo+IEluIHRoZSB0b29scy9NYWtlZmlsZSwgdGhlcmUgaXMgdGhpcyB0YXJnZXQgYXQgTGluZSAy
MDQKPgo+IC5QSE9OWTogcWVtdS14ZW4tZGlyLWZvcmNlLXVwZGF0ZQo+IHFlbXUteGVuLWRpci1m
b3JjZS11cGRhdGU6IHFlbXUteGVuLWRpci1maW5kCj4gICAgICAgICBzZXQgLWV4OyBcCj4gICAg
ICAgICBpZiBbICIkKFFFTVVfVVBTVFJFQU1fUkVWSVNJT04pIiBdOyB0aGVuIFwKPiAgICAgICAg
ICAgICAgICAgY2QgcWVtdS14ZW4tZGlyLXJlbW90ZTsgXAo+ICAgICAgICAgICAgICAgICAkKEdJ
VCkgZmV0Y2ggb3JpZ2luOyBcCj4gICAgICAgICAgICAgICAgICQoR0lUKSByZXNldCAtLWhhcmQg
JChRRU1VX1VQU1RSRUFNX1JFVklTSU9OKTsgXAo+ICAgICAgICAgZmkKPgo+IGhvd2V2ZXIsIGkg
Y2FuJ3QgZmluZCBhbnkgb3RoZXIgbWVudGlvbiBvZiB0aGUgZGlyZWN0b3J5ICJxZW11LXhlbi1k
aXItcmVtb3RlOyIKPiBpbiB0aGUgc291cmNlIHRyZWUsIG90aGVyIHRoYW4gdGhlIHJlbW92YWwg
b2YgaXQgaW4gdGhlIHNhbWUKPiBNYWtlZmlsZSdzIGRpc3RjbGVhbgo+IC4uLgo+Cj4gc28gd2hl
cmUgd291bGQgaXQgZ2V0IGNyZWF0ZWQgPwoKVG8gYW5zd2VyIHRoaXMgb25lIG15c2VsZjogaWYg
b25lIGFsbG93cyB0aGUgWGVuIGluc3RhbGwgdG8gY2xvbmUKdGhlIFFFTVUgaW5zdGFsbGF0aW9u
IHRoZW4KCnFlbXUteGVuLWRpci1yZW1vdGUKCmlzIG5hbWVkIG9mIHRoZSBkaXJlY3RvcnkgdGhh
dCBnZXRzIGNyZWF0ZWQgYnkgYSBzY3JpcHQsIGhvd3Zlcgp3aXRoaW4gdGhlIHNjcmlwdCB0aGUg
bmFtZSBjb21lcyBmcm9tIGEgJHtRRU1VX0RJUn0tcmVtb3RlCmNvbnN0cnVjdCwgaGVuY2UgaXQg
bm90IGJlaW5nIHZpc2lzYmxlIHRvIGEgcGxhaW4gdGV4dCBzZWFyY2ggYWNyb3NzCnRoZSBzb3Vy
Y2UgdHJlZSwgZXhjZXB0IGF0IHRoZSBwb2ludCB3aGVyZSB0aGUgTWFrZWZpbGUgcmVmZXJlbmNl
cyBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
