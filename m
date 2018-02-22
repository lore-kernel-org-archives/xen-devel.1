From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] build: Rename as-insn-check to as-insn-add
Date: Thu, 22 Feb 2018 05:22:18 -0700
Message-ID: <5A8EC40A02000078001AA5CD@prv-mh.provo.novell.com>
References: <1519296673-19470-1-git-send-email-andrew.cooper3@citrix.com>
 <5A8EB8A402000078001AA56C@prv-mh.provo.novell.com>
 <3ce4604a-1f4c-1ee3-cff1-884fd2c1226c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3ce4604a-1f4c-1ee3-cff1-884fd2c1226c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, IanJackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDEyOjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDIvMTggMTE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMi4w
Mi4xOCBhdCAxMTo1MSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gYXMt
aW5zbi1jaGVjayBtdXRhdGVzIHRoZSBwYXNzZWQtaW4gZmxhZ3MuICBSZW5hbWUgaXQgdG8gYXMt
aW5zbi1hZGQsIGluIGxpbmUKPj4+IHdpdGggY2Mtb3B0aW9uLWFkZC4gIFVwZGF0ZSBhbGwgY2Fs
bGVycy4KPj4gSSdtIG5vdCBjb252aW5jZWQgLSBjYy1vcHRpb24tYWRkIG1ha2VzIHJlbGF0aXZl
bHkgY2xlYXIgdGhhdAo+PiBzb21ldGhpbmcgaXMgYmVpbmcgYWRkZWQgdG8gdGhlIG9wdGlvbnMg
cGFzc2VkIHRvIENDLiBJZiBJCj4+IHRha2UgYXMtaW5zbi1hZGQgdGhpcyB3YXksIHRoZSBtYWNy
byB3b3VsZCBuZWVkIHRvIGFkZCBhbgo+PiBpbnNuIHRvIHRoZSBBUyBpbnZvY2F0aW9uLiBXaGls
ZSBJIGFncmVlIGFzLWluc24tY2hlY2sgZG9lc24ndAo+PiBtYWtlIGNsZWFyIHRoYXQgaXQgYWRk
cyBhbnkgb3B0aW9ucywgSSBzdGlsbCBmaW5kIHRoaXMgbGVzcwo+PiBtaXNsZWFkaW5nIHRoYW4g
dGhlIHN1Z2dlc3RlZCBuZXcgbmFtZS4gTGV0J3Mgc2VlIHdoYXQKPj4gb3RoZXJzIHRoaW5rLgo+
IAo+IEknbSBvcGVuIHRvIGJldHRlciBuYW1lIHN1Z2dlc3Rpb25zLgoKVGhlIGJlc3QgSSBjYW4g
Y29tZSB1cCB3aXRoIGlzLCB3ZWxsLCBhcy1pbnNuLWNoZWNrLCBhcyB0aGF0CnJlYXNvbmFibHkg
ZGVzY3JpYmVzIGF0IGxlYXN0IHBhcnQgb2Ygd2hhdCB0aGUgY29uc3RydWN0IGRvZXMuCmFzLWlu
c24tY2hlY2stYW5kLWFkZC1vcHRpb24sIGJlc2lkZXMgYmVpbmcgdG9vIGxvbmcsIGlzbid0Cm1l
YW5pbmdmdWxseSBiZXR0ZXIuCgo+ICBjYy1vcHRpb24tYWRkIGFuZCBhcy1pbnNuLWNoZWNrCj4g
YXJlIGJhc2ljYWxseSB0aGUgc2FtZTsgdGhleSBtYWtlIGEgdGVzdCBiYXNlZCBvbiBhIHByb3Bv
c2VkIGNvbnN0cnVjdCwKPiBhbmQgZW5kIHVwIG11dGF0aW5nIEZMQUdTLgo+IAo+IFRoZSByZWFz
b24gSSBub3RpY2VkIGlzIGJlY2F1c2UgUm9nZXJzIHBhdGNoIGFkZHMgYW4gb3B0aW9uLW5vIGNh
c2UgdG8KPiBhcy1pbnNuLWNoZWNrLgoKV2hpY2ggZG9lc24ndCBtYWtlIHRoZSBuYW1lIGFueSB3
b3JzZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
