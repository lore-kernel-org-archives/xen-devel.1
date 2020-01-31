Return-Path: <SRS0=nADe=3U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE13C2D0DB
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jan 2020 14:58:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A3720705
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jan 2020 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6A3720705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXkl-0005A5-Gn; Fri, 31 Jan 2020 14:58:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixXkj-00059z-Fm
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:58:37 +0000
X-Inumbo-ID: 286a58f1-443a-11ea-8bd7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 286a58f1-443a-11ea-8bd7-12813bfff9fa;
 Fri, 31 Jan 2020 14:58:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXkh-0004mV-JE; Fri, 31 Jan 2020 14:58:35 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXkh-0001ZI-Ad; Fri, 31 Jan 2020 14:58:35 +0000
Date: Fri, 31 Jan 2020 14:58:32 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200131145832.wx7idhgeqo7qfcoc@debian>
References: <20200131142557.2896-1-jgross@suse.com>
 <20200131145544.wzm7537gpzmx3bov@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131145544.wzm7537gpzmx3bov@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: don't apply write limiting
 for privileged domain
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDI6NTU6NDRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEphbiAzMSwgMjAyMCBhdCAwMzoyNTo1N1BNICswMTAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+ID4gWGVuc3RvcmUgd3JpdGUgbGltaXRpbmcgc2hvdWxkIG5vdCBiZSBhcHBsaWVk
IHRvIGRvbTAuIFVuZm9ydHVuYXRlbHkKPiA+IHdyaXRlIGxpbWl0aW5nIGlzIGRpc2FibGVkIG9u
bHkgZm9yIGNvbm5lY3Rpb25zIHZpYSBzb2NrZXRzLiBXaGVuCj4gPiBydW5uaW5nIGluIGEgc3R1
YmRvbSBYZW5zdG9yZSB3aWxsIGFwcGx5IHdyaXRlIGxpbWl0aW5nIHRvIGRvbTAsIHRvby4KPiA+
IENoYW5nZSB0aGF0IGJ5IHRlc3RpbmcgZm9yIHRoZSBkb21haW4gdG8gYmUgcHJpdmlsZWdlZCBh
cyB3ZWxsLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gCj4gPiAtLS0KPiA+
ICB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2RvbWFpbi5jCj4gPiBpbmRleCAxYTgzMDk3OTUyLi5jN2M2YzU3NGRmIDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jCj4gPiArKysgYi90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKPiA+IEBAIC05MTgsOCArOTE4LDggQEAg
dm9pZCB3cmxfYXBwbHlfZGViaXRfYWN0dWFsKHN0cnVjdCBkb21haW4gKmRvbWFpbikKPiA+ICB7
Cj4gPiAgCXN0cnVjdCB3cmxfdGltZXN0YW1wdCBub3c7Cj4gPiAgCj4gPiAtCWlmICghZG9tYWlu
KQo+ID4gLQkJLyogc29ja2V0cyBlc2NhcGUgdGhlIHdyaXRlIHJhdGUgbGltaXQgKi8KPiA+ICsJ
aWYgKCFkb21haW4gfHwgIWRvbWlkX2lzX3VucHJpdmlsZWdlZChkb21haW4tPmRvbWlkKSkKPiA+
ICsJCS8qIHNvY2tldHMgYW5kIGRvbTAgZXNjYXBlIHRoZSB3cml0ZSByYXRlIGxpbWl0ICovCgpB
Y3R1YWxseSBJIHRoaW5rIGNoYW5naW5nIGRvbTAgdG8gInByaXZpbGVnZWQgZG9tYWluIiBtYWtl
cyBtb3JlIHNlbnNlCmhlcmUgYmVjYXVzZSB5b3UncmUgYWxsb3dlZCB0byBzcGVjaWZ5IGEgbm9u
LTAgZG9tYWluIElEIGFzIHByaXZpbGVnZWQKZG9taWQuCgpJZiB5b3UgYWdyZWUgSSBjYW4gZml4
IGl0IHdoaWxlIGNvbW1pdHRpbmcuCgpXZWkuCgo+ID4gIAkJcmV0dXJuOwo+ID4gIAo+ID4gIAl3
cmxfZ2V0dGltZV9ub3coJm5vdyk7Cj4gPiAtLSAKPiA+IDIuMTYuNAo+ID4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
