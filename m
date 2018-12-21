From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen/dom0: Add a dom0-iommu=none option
Date: Fri, 21 Dec 2018 13:01:22 +0000
Message-ID: <267832b7-bcdd-4cde-8041-2944f43dee47@citrix.com>
References: <1545349252-16401-1-git-send-email-andrew.cooper3@citrix.com>
 <1545349252-16401-3-git-send-email-andrew.cooper3@citrix.com>
 <20181221124451.ww6xpxkjqdm74fov@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181221124451.ww6xpxkjqdm74fov@mac.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMTIvMjAxOCAxMjo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIERl
YyAyMCwgMjAxOCBhdCAxMTo0MDo1MlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBG
b3IgZGV2ZWxvcG1lbnQgcHVycG9zZXMsIGl0IGlzIHZlcnkgY29udmVuaWVudCB0byBib290IFhl
biBhcyBhIFBWSCBndWVzdCwKPj4gd2l0aCBhbiBYVEYgUFYgb3IgUFZIICJkb20wIi4gIFRoZSBl
ZGl0LWNvbXBpbGUtZ28gY3ljbGUgaXMgYSBtYXR0ZXIgb2YKPj4gc2Vjb25kcywgYW5kIHlvdSBj
YW4gcmVzb25hYmx5IGluc2VydCBwcmludGsoKSBkZWJ1Z2dpbmcgaW4gcGxhY2VzIHdoaWNoIHdo
aWNoCj4+IHdvdWxkIGJlIGNvbXBsZXRlbHkgaW5mZWFzaWJsZSB3aGVuIGJvb3RpbmcgZnVsbHkt
ZmxlZGdlZCBndWVzdHMuCj4+Cj4+IEhvd2V2ZXIsIHRoZSBQVkggZG9tMCBwYXRoIGluc2lzdHMg
b24gaGF2aW5nIGEgd29ya2luZyBJT01NVSwgd2hpY2ggZG9lc24ndAo+PiBleGlzdCB3aGVuIHZp
cnR1YWxpc2VkIGFzIGEgUFZIIGd1ZXN0LCBhbmQgaXNuJ3QgbmVjZXNzYXJ5IGZvciBYVEYgYW55
d2F5Lgo+Pgo+PiBJbnRyb2R1Y2UgYSBkZXZlbG9wZXIgbW9kZSB0byBza2lwIHRoZSBJT01NVSBy
ZXF1aXJlbWVudC4KPiBUaGlzIGxvb2tzIHZlcnkgc2ltaWxhciB0byB0aGUgY3VycmVudCAncGFz
c3Rocm91Z2gnIG9wdGlvbiwgbWF5YmUgaXQKPiB3b3VsZCBiZSBlbm91Z2ggdG8gYWxsb3cgUFZI
IGRvbTAgdG8gdXNlIHRoZSBwYXNzdGhyb3VnaCBvcHRpb24KPiBwcm92aWRlZCBhIHdhcm5pbmcg
aXMgYWRkZWQgdG8KPiBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVkX2h3ZG9tPwoKSSBj
b25zaWRlcmVkIHRoYXQsIGJ1dCAiZG9tMC1pb21tdT1wYXNzdGhyb3VnaCIgaXNuJ3QgYW4gYWNj
dXJhdGUKZGVzY3JpcHRpb24gb2Ygd2hhdCBpcyBnb2luZyBvbi7CoCBGcmFua2x5LCBpdHMgbm90
IGNvcnJlY3QgZm9yIFBWIGVpdGhlci4KClRCSCwgZG9tMC1pb21tdT1ub25lIGlzIGJldHRlciBm
b3IgYm90aC7CoCBIb3cgYWJvdXQgSSBpbnRyb2R1Y2UgdGhhdCBhcwp0aGUgbmV3IG9wdGlvbiwg
YW5kIGxlYXZlIHBhc3N0aHJvdWdoIGFzIGEgbGVnYWN5IGFsaWFzPwoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
