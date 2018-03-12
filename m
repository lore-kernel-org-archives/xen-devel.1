From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/VMX: don't risk corrupting host CR4
Date: Mon, 12 Mar 2018 00:18:14 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1910437CF@SHSMSX101.ccr.corp.intel.com>
References: <5AA2A5D202000078001B0490@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tnsw=gc=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1evBAZ-0004ad-Vf
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 00:18:28 +0000
In-Reply-To: <5AA2A5D202000078001B0490@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgTWFyY2ggOSwgMjAxOCAxMDoxOSBQTQo+IAo+IEluc3RlYWQgb2YgInN5bmNpbmciIHRo
ZSBsaXZlIHZhbHVlIHRvIHdoYXQgbW11X2NyNF9mZWF0dXJlcyBoYXMsIG1ha2UKPiBzdXJlIHZD
UFUtcyBydW4gd2l0aCB0aGUgdmFsdWUgbW9zdCByZWNlbnRseSBsb2FkZWQgaW50byAlY3I0LCBz
dWNoIHRoYXQKPiBhZnRlciB0aGUgbmV4dCBWTSBleGl0IHdlIGNvbnRpbnVlIHRvIHJ1biB3aXRo
IHRoZSBpbnRlbmRlZCB2YWx1ZSByYXRoZXIKPiB0aGFuIGEgcG9zc2libHkgc3RhbGUgb25lLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
