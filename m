From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 05/16] x86/HVM: add wrapper for
 hvm_funcs.set_tsc_offset()
Date: Fri, 13 Jul 2018 13:19:51 +0100
Message-ID: <4d925507-6b4e-240d-a4c6-c2de6dc2fdf5@citrix.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46057302000078001D325B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aqzi=j5=citrix.com=prvs=725a9f4ea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdxAa-0002aT-E0
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 12:27:32 +0000
In-Reply-To: <5B46057302000078001D325B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEl0J3MgdXNlZCBpbiBxdWl0
ZSBhIGZldyBwbGFjZXMsIGFuZCBoZW5jZSBkb2luZyBzbyBlYXNlcyBzdWJzZXF1ZW50Cj4gYWRq
dXN0bWVudCB0byBob3cgdGhlc2UgKGluZGlyZWN0KSBjYWxscyBhcmUgY2FycmllZCBvdXQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCk92ZXJhbGws
IEknZCBzYXkgdGhhdCBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgd3JhcHBlcnMgZm9yIGFsbCB0
aGUKZnVuY3Rpb25zLCB0byBtYWtlIGEgY2xlYW5lciBBUEkuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
