From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v9 05/11] x86/hvm: Permit guests direct
 access to MSR_{SPEC_CTRL, PRED_CMD}
Date: Thu, 18 Jan 2018 13:04:01 -0500
Message-ID: <d2f22673-7545-7c1b-cf81-2dc1c2998732@oracle.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516290370-14958-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTgvMjAxOCAxMDo0NiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGb3IgcGVyZm9y
bWFuY2UgcmVhc29ucywgSFZNIGd1ZXN0cyBzaG91bGQgaGF2ZSBkaXJlY3QgYWNjZXNzIHRvIHRo
ZXNlIE1TUnMKPiB3aGVuIHBvc3NpYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgo+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5j
b20+Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IENDOiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBTdXJhdmVlIFN1dGhp
a3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+Cj4gdjc6Cj4gICogRHJv
cCBleGNlc3MgYnJhY2tldHMKPiB2OToKPiAgKiBSZS1pbXBsZW1lbnQgaXQgbGlnaHQgb2YgSW50
ZWxzIG5ldyBzcGVjLiAgRHJvcCBSLWJ5J3MuCj4gICogU3BlbGxpbmcgZml4ZXMKClJldmlld2Vk
LWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
