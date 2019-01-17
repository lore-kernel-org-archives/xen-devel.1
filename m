From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3] x86-64/Xen: fix stack switching
Date: Wed, 16 Jan 2019 16:09:52 -0800
Message-ID: <CALCETrXhDXbi7q6w7EkaT7=9P90kUuivQhz3B0HtoBapFgjkuA__15775.989162694$1547683766$gmane$org@mail.gmail.com>
References: <5AF03EBD02000078001C1303@prv1-mh.provo.novell.com>
 <5AF03EBD02000000000F91D6@prv1-mh.provo.novell.com>
 <5AF03EBD02000078001FE590@prv1-mh.provo.novell.com>
 <5C3E1128020000780020DFAD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ca2f=PZ=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1gjvGX-0004Sk-C1
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 00:10:37 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2193F20883
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jan 2019 00:10:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z5so8963049wrt.11
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 16:10:05 -0800 (PST)
In-Reply-To: <5C3E1128020000780020DFAD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@elte.hu>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgODo1OCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gV2hpbGUgaW4gdGhlIG5hdGl2ZSBjYXNlIGVudHJ5IGludG8gdGhl
IGtlcm5lbCBoYXBwZW5zIG9uIHRoZSB0cmFtcG9saW5lCj4gc3RhY2ssIFBWIFhlbiBrZXJuZWxz
IGdldCBlbnRlcmVkIHdpdGggdGhlIGN1cnJlbnQgdGhyZWFkIHN0YWNrIHJpZ2h0Cj4gYXdheS4g
SGVuY2Ugc291cmNlIGFuZCBkZXN0aW5hdGlvbiBzdGFja3MgYXJlIGlkZW50aWNhbCBpbiB0aGF0
IGNhc2UsCj4gYW5kIHNwZWNpYWwgY2FyZSBpcyBuZWVkZWQuCj4KPiBPdGhlciB0aGFuIGluIHN5
bmNfcmVncygpIHRoZSBjb3B5aW5nIGRvbmUgb24gdGhlIElOVDgwIHBhdGggaXNuJ3QKPiBOTUkg
LyAjTUMgc2FmZSwgYXMgZWl0aGVyIG9mIHRoZXNlIGV2ZW50cyBvY2N1cnJpbmcgaW4gdGhlIG1p
ZGRsZSBvZiB0aGUKPiBzdGFjayBjb3B5aW5nIHdvdWxkIGNsb2JiZXIgZGF0YSBvbiB0aGUgKHNv
dXJjZSkgc3RhY2suCj4KPiBJJ20gbm90IGFsdGVyaW5nIHRoZSBzaW1pbGFyIGNvZGUgaW4gaW50
ZXJydXB0X2VudHJ5KCkgYW5kIG5taSgpLCBhcwo+IHRob3NlIGNvZGUgcGF0aHMgYXJlIHVucmVh
Y2hhYmxlIGFmYWljdCB3aGVuIHJ1bm5pbmcgUFYgWGVuIGd1ZXN0cy4KCgpBY2tlZC1ieTogQW5k
eSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
