From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Wed, 27 Mar 2019 15:55:10 +0000
Message-ID: <e10c14cd-54ac-8d8c-2d5c-db4adbd39d07@citrix.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kI0R=R6=citrix.com=prvs=9824fb700=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9BDc-0004RR-Un
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:16:00 +0000
In-Reply-To: <20190318131155.29450-5-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDMvMjAxOSAxMzoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbnN0ZWFkIG9mIGZy
ZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPiBh
Z2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBh
IGNwdSBkaWRuJ3QKPiBjb21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpIbW0gLSB0aGlzIGlzIHNsaWdo
dGx5IHByb2JsZW1hdGljLCBnaXZlbiB0aGUgZHVhbCBuYXR1cmUgb2YgdGhpcyBjb2RlLgoKSSBh
Z3JlZSB0aGF0IGl0IHRoaXMgY2hhbmdlIGlzIGJlbmVmaWNpYWwgZm9yIHRoZSBzdXNwZW5kIGNh
c2UsIGJ1dCBpdAppcyBhIHByb2JsZW0gd2hlbiB3ZSBhcmUgcGFya2luZyBhbiBpbmRpdmlkdWFs
IENQVSBmb3Igc210PTAgb3IKeGVuLWhwdG9vbCByZWFzb25zLgoKRG8gd2UgaGF2ZSBhbnkgaGlu
dCB3ZSBjYW4gdXNlIHdoZW4gdGFraW5nIHRoZSBDUFUgZG93biBhcyB0byB3aGV0aGVyCndlJ3Jl
IGV4cGVjdGluZyBpdCB0byBjb21lIHN0cmFpZ2h0IGJhY2sgdXAgYWdhaW4/Cgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
