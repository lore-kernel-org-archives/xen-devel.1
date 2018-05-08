From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] x86-64/Xen: fix stack switching
Date: Tue, 08 May 2018 02:38:25 +0000
Message-ID: <CALCETrX=SM=YBSpRv53Qmxk2PkHcTFWWvw-JGOh0C4UpvTReAA__35510.5569739409$1525747054$gmane$org@mail.gmail.com>
References: <5AF03EBD02000078001C1303@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gezt=h3=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1fFsWV-0007tD-9h
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 02:38:39 +0000
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC2B020C48
 for <xen-devel@lists.xenproject.org>; Tue,  8 May 2018 02:38:36 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id x12-v6so17316974wmc.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 May 2018 19:38:36 -0700 (PDT)
In-Reply-To: <5AF03EBD02000078001C1303@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@elte.hu>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgNywgMjAxOCBhdCA1OjE2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cgo+IFdoaWxlIG9uIG5hdGl2ZSBlbnRyeSBpbnRvIHRoZSBrZXJuZWwgaGFw
cGVucyBvbiB0aGUgdHJhbXBvbGluZSBzdGFjaywKPiBQViBYZW4ga2VybmVscyBhcmUgYmVpbmcg
ZW50ZXJlZCB3aXRoIHRoZSBjdXJyZW50IHRocmVhZCBzdGFjayByaWdodAo+IGF3YXkuIEhlbmNl
IHNvdXJjZSBhbmQgZGVzdGluYXRpb24gc3RhY2tzIGFyZSBpZGVudGljYWwgaW4gdGhhdCBjYXNl
LAo+IGFuZCBzcGVjaWFsIGNhcmUgaXMgbmVlZGVkLgoKPiBPdGhlciB0aGFuIGluIHN5bmNfcmVn
cygpIHRoZSBjb3B5aW5nIGRvbmUgb24gdGhlIElOVDgwIHBhdGggYXMgd2VsbCBhcwo+IG9uIHRo
ZSBOTUkgcGF0aCBpdHNlbGYgaXNuJ3QgTk1JIC8gI01DIHNhZmUsIGFzIGVpdGhlciBvZiB0aGVz
ZSBldmVudHMKPiBvY2N1cnJpbmcgaW4gdGhlIG1pZGRsZSBvZiB0aGUgc3RhY2sgY29weWluZyB3
b3VsZCBjbG9iYmVyIGRhdGEgb24gdGhlCj4gKHNvdXJjZSkgc3RhY2suIChPZiBjb3Vyc2UsIGlu
IHRoZSBOTUkgY2FzZSBvbmx5ICNNQyBjb3VsZCBicmVhawo+IHRoaW5ncy4pCgpJIHRoaW5rIEkn
ZCByYXRoZXIgZml4IHRoaXMgYnkgY2hhbmdpbmcgdGhlIHN0YWNrIHN3aXRjaCBjb2RlIG9yCmFs
dGVybmF0aXZpbmcgYXJvdW5kIGl0IG9uIG5vbi1zdGFjay1zd2l0Y2hpbmcga2VybmVscy4gIE9y
IG1ha2UgWGVuIHVzZSBhCnRyYW1wb2xpbmUgc3RhY2sganVzdCBsaWtlIG5hdGl2ZS4KCgo+IEkn
bSBub3QgYWx0ZXJpbmcgdGhlIHNpbWlsYXIgY29kZSBpbiBpbnRlcnJ1cHRfZW50cnkoKSwgYXMg
dGhhdCBjb2RlCj4gcGF0aCBpcyB1bnJlYWNoYWJsZSB3aGVuIHJ1bm5pbmcgYW4gUFYgWGVuIGd1
ZXN0IGFmYWljdC4KCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+IC0tLQo+IFRoZXJlIHdvdWxkIGNlcnRhaW5s
eSBoYXZlIGJlZW4gdGhlIG9wdGlvbiBvZiB1c2luZyBhbHRlcm5hdGl2ZXMKPiBwYXRjaGluZywg
YnV0IGFmYWljdCB0aGUgcGF0Y2hpbmcgY29kZSBpc24ndCBOTUkgLyAjTUMgc2FmZSwgc28gSSdk
Cj4gcmF0aGVyIHN0YXkgYXdheSBmcm9tIHBhdGNoaW5nIHRoZSBOTUkgcGF0aC4gQW5kIEkgdGhv
dWdodCBpdCB3b3VsZCBiZQo+IGJldHRlciB0byB1c2Ugc2ltaWxhciBjb2RlIGluIGJvdGggY2Fz
ZXMuCgpJIHdvdWxkIGhvcGUgd2UgZG8gdGhlIHBhdGNoaW5nIGJlZm9yZSB3ZSBlbmFibGUgYW55
IE5NSXMuCgoKPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBtYWtlIHRoZSBYZW4gY2FzZSBt
YXRjaCB0aGUgbmF0aXZlIG9uZSwgYnkKPiBnb2luZyB0aHJvdWdoIHRoZSB0cmFtcG9saW5lIHN0
YWNrLCBidXQgdG8gbWUgdGhpcyB3b3VsZCBsb29rIGxpa2UgZXh0cmEKPiBvdmVyaGVhZCBmb3Ig
bm8gZ2Fpbi4KCkF2b2lkaW5nIGV2ZW4gbW9yZSBjb21wbGV4aXR5IGluIHRoZSBubWkgY29kZSBz
ZWVtcyBsaWtlIGEgYmlnIGdhaW4gdG8gbWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
