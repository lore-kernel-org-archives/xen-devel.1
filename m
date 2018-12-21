From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2 8/8] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
Date: Fri, 21 Dec 2018 11:53:23 +0000
Message-ID: <eaae5c09-3f26-9c83-d1cd-2a39705f85d6@arm.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-9-julien.grall@arm.com>
 <alpine.DEB.2.10.1812201525040.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaJMv-000278-7M
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 11:53:29 +0000
In-Reply-To: <alpine.DEB.2.10.1812201525040.15901@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIwLzEyLzIwMTggMjM6MjUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDIwIERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Pgo+PiBPbmx5IHJlYXNvbmFibGUgY2xlYW4tdXBzIGFy
ZSBkb25lIGluIHRoaXMgcGF0Y2guIFRoZSByZXN0IHdpbGwgdXNlIF9nZm4KPj4gZm9yIHRoZSB0
aW1lIGJlaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGUgYmFuZHdpZHRoIHRvIHJldmlldyB0aGlz
IHBhdGNoIGJlZm9yZSB0aGUgaG9saWRheXMsIGJ1dAo+IGl0IGlzIG5vdCByZXF1aXJlZCBmb3Ig
dGhlIGZlYXR1cmUgdG8gZ28gaW4uCgpUaGF0J3MgZmluZS4gVGhpcyBwYXRjaCBpcyBqdXN0IGEg
Y2xlYW5lZC11cC4gVGhhbmsgeW91IGZvciByZXZpZXcgdGhlIHJlc3Qgb2YgCnRoZSBzZXJpZXMh
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
