From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
	suspend
Date: Mon, 26 Feb 2018 09:17:16 -0700
Message-ID: <5A94411C02000078001ABDF1__49367.8681589246$1519661783$gmane$org@prv-mh.provo.novell.com>
References: <20180226140818.4849-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uzez=fu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqLSs-00008x-7f
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 16:17:22 +0000
In-Reply-To: <20180226140818.4849-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDE1OjA4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbGRl
ciBYZW4gdmVyc2lvbnMgKDQuNSBhbmQgYmVmb3JlKSBtaWdodCBoYXZlIHByb2JsZW1zIG1pZ3Jh
dGluZyBwdgo+IGd1ZXN0cyB3aXRoIE1TUl9JQTMyX1NQRUNfQ1RSTCBoYXZpbmcgYSBub24temVy
byB2YWx1ZS4gU28gYmVmb3JlCj4gc3VzcGVuZGluZyB6ZXJvIHRoYXQgTVNSIGFuZCByZXN0b3Jl
IGl0IGFmdGVyIGJlaW5nIHJlc3VtZWQuCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcg
Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
