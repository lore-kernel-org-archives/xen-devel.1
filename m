From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 12:02:39 +0100
Message-ID: <672aa7a1-7e0c-4209-4fbd-649cdb983dc5@citrix.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de>
 <298ec681a9c38eb7618e6b3e226486691e9eab4d.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <298ec681a9c38eb7618e6b3e226486691e9eab4d.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTEvMjAxOCAxMToxNyBBTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gV2VkLCAy
MDE4LTA0LTExIGF0IDEyOjAwICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4gT24gV2VkLCBB
cHIgMTEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pgo+Pj4gT2xhZiwgY2FuIHlvdSBnaXZlIGl0
IGEgdHJ5PyBJdCBzaG91bGQgYmUgZmluZSB0byBydW4gaXQgb24gdG9wIG9mCj4+PiB0aGUKPj4+
IGxhc3QgZGVidWcgcGF0Y2ggKHRoZSBvbmUgdGhhdCBwcm9kdWNlZCB0aGlzIGNyYXNoKS4KPj4K
Pj4gWWVzLCB3aXRoIGJvdGggY2hhbmdlcyBpdCBkaWQgPjRrIGl0ZXJhdGlvbnMgYWxyZWFkeS4g
VGhhbmtzLgo+Pgo+IFRoYXQncyBncmVhdCB0byBoZWFyISA6LUQKPiAKPiBOb3csIEkgdGhpbmsg
SSdsbCBzdWJtaXQgaXQgYXMgYSBwcm9wZXIgcGF0Y2ggaW4gdGhlIHZhcmlhbnQgdGhhdAo+IEp1
ZXJnZW4gc3VnZ2VzdGVkLCBhbmQgdGhhdCBJIGFsc28gd2VyZSB0aGlua2luZyB0byB1c2UuCj4g
Cj4gR2VvcmdlLCBhbnkgb3Bpbmlvbj8gSSdtIGdvaW5nIHNvbWV3aGVyZSBub3cuIElmIEkgZG9u
J3QgaGVhciBhbnkKPiBwdXNoYmFjaywgSSdsbCBkbyB0aGF0IGFzIHNvb24gYXMgYmFjay4KCkkg
dGhpbmsgZm9yIHNpbXBsaWNpdHkgLyByZWxpYWJpbGl0eSBvZiBiYWNrcG9ydGluZywgd2Ugc2hv
dWxkIHN0YXJ0CndpdGggYSBwYXRjaCBsaWtlIHRoZSBvbmUgeW91IGdhdmUgdG8gT2xhZiAoaS5l
LiwgYWRkaW5nIHRoZSAibWlzc2luZyIKdmNwdV9zbGVlcF9ub3N5bmMoKSkuCgpNb3ZpbmcgZm9y
d2FyZCB3ZSBzaG91bGQgZGVmaW5pdGVseSBtb3ZlIHRoaW5ncyBhcm91bmQgc28gdGhhdCB0aGVy
ZSdzCm5vIHJpc2sgb2YgYWNjaWRlbnRhbGx5IGZvcmdldHRpbmcgdG8gdGFrZSB0aGUgdmNwdSBv
ZmYgdGhlIHJ1bnF1ZXVlLApidXQgdGhlcmUgYXJlIHNvbWUgb3RoZXIgY2hhbmdlcyBpdCBtaWdo
dCBiZSBuaWNlIHRvIG1ha2UgYXMgd2VsbDsgZm9yCmluc3RhbmNlLCBpdCBsb29rcyBsaWtlIG9u
IGEgYnVzeSBzeXN0ZW0gdGhlcmUgbWF5IGJlIGEgZmFpciBhbW91bnQgb2YKZHVwbGljYXRlIGNw
dV9waWNrKCkgY2FsY3VsYXRpb25zOyBpdCB3b3VsZCBiZSBuaWNlIHRvIGF2b2lkIHRoYXQuCgpC
dXQgdGhvc2UgcHJvYmFibHkgc2hvdWxkbid0IGJlIGRvbmUgZHVyaW5nIHRoZSBmZWF0dXJlIGZy
ZWV6ZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
