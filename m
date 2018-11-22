From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 11/14] xen/mm: Switch
 mfn_to_virt()/virt_to_mfn() to using mfn_t
Date: Thu, 22 Nov 2018 14:32:27 +0000
Message-ID: <a463b994-2fe4-7ac6-d47a-9935d3f33f5d@arm.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-12-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-12-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTEvMjEvMTggMToyMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBT
ZWVtaW5nbHksIGEgbWFqb3JpdHkgb2YgdXNlcnMgZWl0aGVyIG92ZXJyaWRlIHRoZSBoZWxwZXJz
IGFueXdheSwgb3IgaGF2ZSBhbgo+IG1mbl90IGluIHRoZWlyIGhhbmRzLgo+IAo+IFVwZGF0ZSB0
aGUgQVBJLCBhbmQgYWRqdXN0IGFsbCB1c2VycyB0byBtYXRjaC4gIEluIHNvbWUgcGxhY2VzLCB1
c2UgdGhlCj4gdW5zaWduZWQgbG9uZyB2YXJpYW50IGluIHBsYWNlcyB3aGVyZSB3ZSBhcmUgaW50
ZXJhY3Rpbmcgd2l0aCBhbiBleHRlcm5hbAo+IHN0cnVjdCBhbmQgdGhlcmUgaXMgbm8gY2hhbmNl
IG9mIHRoZW0gc3dpdGNoaW5nIHRvIG1mbl90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBUk0gJiBjb21tb24gY29kZToKClJl
dmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
