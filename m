From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/7] x86: remove CR reads from
	exit-to-guest path
Date: Thu, 1 Mar 2018 19:23:17 +0000
Message-ID: <0ec46ed9-18a3-6818-bd2c-49e47e1fcebf@citrix.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
 <5A7B338F02000078001A6222@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drue=fx=citrix.com=prvs=5913fcd06=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1erTnf-0007Qq-6L
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 19:23:31 +0000
In-Reply-To: <5A7B338F02000078001A6222@prv-mh.provo.novell.com>
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

T24gMDcvMDIvMTggMTY6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENSMyBpcyAtIGR1cmluZyBu
b3JtYWwgb3BlcmF0aW9uIC0gb25seSBldmVyIGxvYWRlZCBmcm9tIHYtPmFyY2guY3IzLAo+IHNv
IHRoZXJlJ3Mgbm8gbmVlZCB0byByZWFkIHRoZSBhY3R1YWwgY29udHJvbCByZWdpc3Rlci4gRm9y
IENSNCB3ZSBjYW4KPiBnZW5lcmFsbHkgdXNlIHRoZSBjYWNoZWQgdmFsdWUgb24gYWxsIHN5bmNo
cm9ub3VzIGVudHJ5IGVuZCBleGl0IHBhdGhzLgo+IERyb3AgdGhlIHdyaXRlX2NyMyBtYWNybywg
YXMgdGhlIHR3byB1c2Ugc2l0ZXMgYXJlIHByb2JhYmx5IGVhc2llciB0bwo+IGZvbGxvdyB3aXRo
b3V0IGl0cyB1c2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
