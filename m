From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: fix race in xen_qlock_wait()
Date: Mon, 1 Oct 2018 10:58:40 +0200
Message-ID: <d75416af-2cc4-595a-48dc-381d14785191__20991.5197491229$1538384242$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yvko=mn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g6u2O-0004CD-At
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 08:58:44 +0000
References: =?UTF-8?B?PDIwMTgxMDAxMDcxNjQxLjE5Mjgy77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?Q?=2ecom=3e_=3c20181001071641=2e19282-2-jgross=40suse=2ecom=3e_=3c5?=
 =?UTF-8?Q?BB1E0B502000078001ED124=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, longman@redhat.com, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAxMDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMTAuMTgg
YXQgMDk6MTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbiB0aGUgZm9sbG93aW5nIHNp
dHVhdGlvbiBhIHZjcHUgd2FpdGluZyBmb3IgYSBsb2NrIG1pZ2h0IG5vdCBiZQo+PiB3b2tlbiB1
cCBmcm9tIHhlbl9wb2xsX2lycSgpOgo+Pgo+PiBDUFUgMTogICAgICAgICAgICAgICAgQ1BVIDI6
ICAgICAgICAgICAgICAgICAgICAgIENQVSAzOgo+PiB0YWtlcyBhIHNwaW5sb2NrCj4+ICAgICAg
ICAgICAgICAgICAgICAgICB0cmllcyB0byBnZXQgbG9jawo+PiAgICAgICAgICAgICAgICAgICAg
ICAgLT4geGVuX3Fsb2NrX3dhaXQoKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAtPiB4ZW5f
Y2xlYXJfaXJxX3BlbmRpbmcoKQo+IAo+IERvZXNuJ3QgdGhlIGxhc3QgbGluZSBhYm92ZSAuLi4K
PiAKPj4gZnJlZXMgdGhlIGxvY2sKPj4gLT4geGVuX3Fsb2NrX2tpY2soY3B1MikKPiAKPiAuLi4g
bmVlZCB0byBiZSBiZWxvdyBoZXJlPwoKWW91IGFyZSByaWdodCwgb2YgY291cnNlIQoKVGhhbmtz
IGZvciBub3RpY2luZy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
