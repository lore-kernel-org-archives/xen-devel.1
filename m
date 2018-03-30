From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Fri, 30 Mar 2018 13:10:23 +0100
Message-ID: <20180330121023.65yrgq3yylfbt4mt@citrix.com>
References: <20180329120944.13888-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180329120944.13888-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDI6MDk6NDNQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xp
YnhsL2xpYnhsX3R5cGVzLmlkbAo+IGluZGV4IGRiYjI4N2Q2ZmUuLjhiODk4YmIzYzkgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfdHlwZXMuaWRsCj4gQEAgLTQ2Niw2ICs0NjYsNyBAQCBsaWJ4bF9kb21haW5fYnVpbGRf
aW5mbyA9IFN0cnVjdCgiZG9tYWluX2J1aWxkX2luZm8iLFsKPiAgICAgICgidmNwdV9zb2Z0X2Fm
ZmluaXR5IiwgQXJyYXkobGlieGxfYml0bWFwLCAibnVtX3ZjcHVfc29mdF9hZmZpbml0eSIpKSwK
PiAgICAgICgibnVtYV9wbGFjZW1lbnQiLCAgbGlieGxfZGVmYm9vbCksCj4gICAgICAoInRzY19t
b2RlIiwgICAgICAgIGxpYnhsX3RzY19tb2RlKSwKPiArICAgICgidnRzY190b2xlcmFuY2Vfa2h6
IiwgdWludDMyKSwKCkdpdmVuIHRoZSBkaWZmZXJlbmNlIGluIHR5cGVzIGhlcmUsIHlvdSBuZWVk
IHRvIGNoZWNrIGZvciB0cnVuY2F0aW9uCndoZXJlIHRoZSB2YWx1ZSBpcyBhc3NpZ25lZCBmcm9t
IHVpbnQzMl90IHRvIHVpbnQxNl90LgoKQnV0IHdoeSBkb24ndCB5b3UgdXNlIHVpbnQxNl90IGhl
cmUgaW5zdGVhZD8gSXMgdGhlcmUgZnV0dXJlIHBsYW4gdG8Kd2lkZW4gaXQgdG8gdWludDMyX3Qg
aW4gdGhlIGh5cGVydmlzb3I/CgpUaGUgcmVzdCBsb29rcyBjb3JyZWN0IHRvIG1lLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
