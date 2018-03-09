From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v1] getpageframeinfo3: replace hardcoded
 batchsize with constant
Date: Fri, 9 Mar 2018 17:46:06 +0000
Message-ID: <b36f12a4-2687-cbf6-5eab-8c7f5f54c493@citrix.com>
References: <20180309161720.17510-1-olaf@aepfle.de>
 <5AA2C39E02000078001B061D@prv-mh.provo.novell.com>
 <ae7b71fa-1493-a61e-1235-90fed2a926e7@citrix.com>
 <5AA2C7D602000078001B067B@prv-mh.provo.novell.com>
 <8da306fb-a1e9-e15c-084e-87091cccef83@citrix.com>
 <137DC3C1-0BA1-48C0-8E3F-3BBE6AB26C20@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <137DC3C1-0BA1-48C0-8E3F-3BBE6AB26C20@aepfle.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDkvMjAxOCAwNDo1NSBQTSwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gVGhlIHBvaW50IHdh
cyB0byBkb2N1bWVudCB0aGUgY291bnRlciBwYXJ0LiBHcmVwIC13IDEwMjQgaXMgbm90IGhlbHBm
dWwuCgpPZiBjb3Vyc2UgLS0geW91ciBwYXRjaCBjZXJ0YWlubHkgbWFrZXMgdGhlIGNvZGViYXNl
IGJldHRlciBieSBtYWtpbmcKdGhpcyBudW1iZXIgc2V0IGluIG9ubHkgb25lIHBsYWNlLCBhbmQg
aW4gbWFraW5nIGl0IGVhc2llciB0byBmaW5kIHdobwplbHNlIGlzIGRlcGVuZGluZyBvbiB0aGlz
IG51bWJlciB3aXRoIGdyZXAuCgpKYW4gaXMgc2F5aW5nLCBob3dldmVyLCBpdCdzIG5vdCBjbGVh
ciB3aHkgd2UgaGF2ZSBzdWNoIGFuIGFyYml0cmFyeQpsaW1pdCBpbiB0aGUgZmlyc3QgcGxhY2Uu
ICBBbmR5IGNsYWltcyBpdCdzIGEgcmVtbmFudCBmcm9tIHRoZSBkYXlzIHdoZW4Kd2Ugd2VyZSBw
YXNzaW5nIGEgc2luZ2xlIHBhZ2UgcmF0aGVyIHRoYW4gYW4gYXJiaXRyYXJ5IGFycmF5OyBpdCBh
bHNvCnNlcnZlcyB0byAgbWFrZSBzdXJlIHRoZSBoeXBlcmNhbGwgZG9lc24ndCBydW4gdG9vIGxv
bmcuICBCdXQgaWYgd2UgdXNlCm5vcm1hbCBoeXBlcmNhbGwgcHJlZW1wdGlvbiwgd2UgZG9uJ3Qg
bmVlZCB0byBoYXZlIHRoaXMgbGltaXQgYXQgYWxsLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
