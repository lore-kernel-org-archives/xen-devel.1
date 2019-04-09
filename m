Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004B4C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:40:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87BA2084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87BA2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnEv-0006xY-Az; Tue, 09 Apr 2019 09:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDnEu-0006xO-4Y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:40:24 +0000
X-Inumbo-ID: 7c8782ec-5aab-11e9-8aa4-a3187577aa4b
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c8782ec-5aab-11e9-8aa4-a3187577aa4b;
 Tue, 09 Apr 2019 09:40:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,328,1549929600"; d="scan'208";a="83089476"
Date: Tue, 9 Apr 2019 10:40:16 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20190409094016.GK1986@zion.uk.xensource.com>
References: <1554497508-32708-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1554497508-32708-1-git-send-email-igor.druzhinin@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] tools/xl: use libxl_domain_info to get
 domain type for vcpu-pin
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
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com,
 ian.jackson@eu.citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409094016.NIy4ovntZioSXYoAO14qc13zI1NhJgoUoQ7KtdfDjcI@z>

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDk6NTE6NDhQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gUGFyc2luZyB0aGUgY29uZmlnIHNlZW1zIHRvIGJlIGFuIG92ZXJraWxsIGZvciB0
aGlzIHBhcnRpY3VsYXIgdGFzawo+IGFuZCB0aGUgY29uZmlnIG1pZ2h0IHNpbXBseSBiZSBhYnNl
bnQuIFR5cGUgcmV0dXJuZWQgc2hvdWxkIGJlIGVpdGhlcgo+IExJQlhMX0RPTUFJTl9UWVBFX0hW
TSBvciBMSUJYTF9ET01BSU5fVFlQRV9QViBidXQgaW4gdGhhdCBjb250ZXh0Cj4gZGlzdGluY3Rp
b24gYmV0d2VlbiBQVkggYW5kIEhWTSBzaG91bGQgYmUgaXJyZWxldmFudC4KClJpZ2h0LCB0aGlz
IG1ha2VzIHNlbnNlLgoKQnV0IHBsZWFzZSBtYWtlIGl0IGNvbXBsZXRlIGJ5IHJlbW92aW5nIHRo
ZSBMSUJYTF9ET01BSU5fVFlQRV9QVkggYnJhbmNoCmluIGFwcGx5X2dsb2JhbF9hZmZpbml0eV9t
YXNrcywgYW5kIGFkZCBhIGNvbW1lbnQgdG8gbm90ZSB0aGF0IFBWSCBhbmQKSFZNIHVzZSB0aGUg
c2FtZSBtYXNrIC4uLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5k
cnV6aGluaW5AY2l0cml4LmNvbT4KPiAtLS0KPiAgdG9vbHMveGwveGxfdmNwdS5jIHwgMTMgKysr
Ky0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy94bC94bF92Y3B1LmMgYi90b29scy94bC94bF92
Y3B1LmMKPiBpbmRleCA3MWQzYTVjLi40YTRkMGZhIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hsL3hs
X3ZjcHUuYwo+ICsrKyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwo+IEBAIC0yODQsMTkgKzI4NCwxNCBA
QCBpbnQgbWFpbl92Y3B1cGluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgCj4gICAgICAvKiBP
bmx5IGhhcmQgYWZmaW5pdHkgbWF0dGVycyBoZXJlICovCj4gICAgICBpZiAoIWlnbm9yZV9tYXNr
cykgewo+IC0gICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgZF9jb25maWc7Cj4gKyAgICAgICAg
bGlieGxfZG9taW5mbyBkb21pbmZvOwo+ICAKCi4uLiBoZXJlLgoKPiAtICAgICAgICBsaWJ4bF9k
b21haW5fY29uZmlnX2luaXQoJmRfY29uZmlnKTsKPiAtICAgICAgICByYyA9IGxpYnhsX3JldHJp
ZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uKGN0eCwgZG9taWQsICZkX2NvbmZpZyk7Cj4gLSAgICAg
ICAgaWYgKHJjKSB7Cj4gLSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiQ291bGQgbm90IHJl
dHJpZXZlIGRvbWFpbiBjb25maWd1cmF0aW9uXG4iKTsKPiAtICAgICAgICAgICAgbGlieGxfZG9t
YWluX2NvbmZpZ19kaXNwb3NlKCZkX2NvbmZpZyk7Cj4gKyAgICAgICAgaWYgKGxpYnhsX2RvbWFp
bl9pbmZvKGN0eCwgJmRvbWluZm8sIGRvbWlkKSkgewo+ICsgICAgICAgICAgICBmcHJpbnRmKHN0
ZGVyciwgIkNvdWxkIG5vdCBnZXQgZG9tYWluIGluZm9cbiIpOwo+ICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiAgICAgICAgICB9Cj4gIAo+IC0gICAgICAgIGFwcGx5X2dsb2JhbF9hZmZpbml0eV9t
YXNrcyhkX2NvbmZpZy5iX2luZm8udHlwZSwgaGFyZCwgMSk7Cj4gLQo+IC0gICAgICAgIGxpYnhs
X2RvbWFpbl9jb25maWdfZGlzcG9zZSgmZF9jb25maWcpOwo+ICsgICAgICAgIGFwcGx5X2dsb2Jh
bF9hZmZpbml0eV9tYXNrcyhkb21pbmZvLmRvbWFpbl90eXBlLCBoYXJkLCAxKTsKPiAgICAgIH0K
PiAgCj4gICAgICBpZiAoZm9yY2UpIHsKPiAtLSAKPiAyLjcuNAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
