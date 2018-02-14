From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v3 1/4] asm-x86/monitor: Fix monitor
 capability reporting on SVM systems
Date: Wed, 14 Feb 2018 19:56:30 +0200
Message-ID: <7636b11b-69b3-60fa-2455-4bf3c1dbe4e1@bitdefender.com>
References: <1518448098-6493-1-git-send-email-aisaila@bitdefender.com>
 <1518448098-6493-2-git-send-email-aisaila@bitdefender.com>
 <fee0cab0-dc3f-eb13-b225-f1f356e934ab@citrix.com>
 <80320fb1-0228-27f6-4297-cb4946738076@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <80320fb1-0228-27f6-4297-cb4946738076@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com
Cc: Alexandru Isaila <aisaila@bitdefender.com>, boris.ostrovsky@oracle.com, suravee.suthikulpanit@amd.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTQvMjAxOCAwNzo0NyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wMi8x
OCAxNToxMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDIvMTggMTU6MDgsIEFsZXhh
bmRydSBJc2FpbGEgd3JvdGU6Cj4+PiBObyBtb25pdG9yIGZlYXR1cmVzIGFyZSBhdmFpbGFibGUg
b24gQU1EIGFuZCBhbGwKPj4+IGNhcGFiaWxpdGllcyBhcmUgcGFzc2VkIG9ubHkgdG8gdGhlIElu
dGVsIHByb2Nlc3NvciBhcmNoaXRlY3R1cmUuCj4+PiBUaGlzIG1lYW5zIHRoYXQgdGhlIGFyY2hf
bW9uaXRvcl9nZXRfY2FwYWJpbGl0aWVzIHJldHVybnMKPj4+IGNhcGFiaWxpdGllcyA9IDAuCj4+
Pgo+Pj4gVGhpcyBwYXRjaCBpcyBzZXBhcmF0aW5nIG91dCBmZWF0dXJlcyB3aGljaCBhcmUgaW1w
bGVtZW50ZWQgb24gYm90aAo+Pj4gc3lzdGVtcyBmcm9tIHRob3NlIGltcGxlbWVudGVkIG9ubHkg
b24gSW50ZWwsIHNvIHRoYXQgd2UgYWR2ZXJ0aXplIHRoZQo+Pj4gd29ya2luZyBjYXBhYmlsaXRp
ZXMgb24gQU1ELgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgo+IAo+IFRoaXMgcGF0Y2ggc3RpbGwgbmVlZHMgYW4gYWNrIGZy
b20gVGFtYXMgb3IgUmF6dmFuLCBidXQgdGhlcmUgaXMgbm8KPiBjb21tZW50IHNvIGZhciB0aGF0
IEkgY2FuIGZpbmQuCgpJIHRoaW5rIFRhbWFzIHByb2JhYmx5IHdvdWxkbid0IG9iamVjdCwgc28g
RldJVzoKCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
