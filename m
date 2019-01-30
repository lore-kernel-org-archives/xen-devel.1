From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v2 2/2] x86/xen: dont add memory above max
 allowed allocation
Date: Wed, 30 Jan 2019 03:59:52 -0700
Message-ID: <C4A55B5E-47A5-454A-AB90-AB52DF42CD88__3852.72840955935$1548846085$gmane$org@oracle.com>
References: <20190130082233.23840-1-jgross@suse.com>
 <20190130082233.23840-3-jgross@suse.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hh0u=QG=oracle.com=william.kucharski@srs-us1.protection.inumbo.net>)
 id 1gonbR-00050i-EO
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 11:00:21 +0000
In-Reply-To: <20190130082233.23840-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, kernel list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEphbiAzMCwgMjAxOSwgYXQgMToyMiBBTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiAKPiArI2lmZGVmIENPTkZJR19NRU1PUllfSE9UUExVRwo+ICsJCQkv
Kgo+ICsJCQkgKiBEb24ndCBhbGxvdyBhZGRpbmcgbWVtb3J5IG5vdCBpbiBFODIwIG1hcCB3aGls
ZQo+ICsJCQkgKiBib290aW5nIHRoZSBzeXN0ZW0uIE9uY2UgdGhlIGJhbGxvb24gZHJpdmVyIGlz
IHVwCj4gKwkJCSAqIGl0IHdpbGwgcmVtb3ZlIHRoYXQgcmVzdHJpY3Rpb24gYWdhaW4uCj4gKwkJ
CSAqLwo+ICsJCQltYXhfbWVtX3NpemUgPSB4ZW5fZTgyMF90YWJsZS5lbnRyaWVzW2ldLmFkZHIg
Kwo+ICsJCQkJICAgICAgIHhlbl9lODIwX3RhYmxlLmVudHJpZXNbaV0uc2l6ZTsKPiArI2VuZGlm
Cj4gCQl9Cj4gCj4gCQlpZiAoIWRpc2NhcmQpCgpSZXZpZXdlZC1ieTogV2lsbGlhbSBLdWNoYXJz
a2kgPHdpbGxpYW0ua3VjaGFyc2tpQG9yYWNsZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
