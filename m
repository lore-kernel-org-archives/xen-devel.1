From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 14:24:55 +0000
Message-ID: <1070c175-0e64-6c3a-7c93-013f0b3612be@citrix.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
 <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
 <743294a2-4cee-5573-abfc-ba6817e7d32e@citrix.com>
 <5BF2C75702000078001FD7F6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BF2C75702000078001FD7F6@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMTEuMTgg
YXQgMTU6MDgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTkvMTEv
MjAxOCAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOS4xMS4xOCBhdCAxNDox
MSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IEluIHByYWN0aWNlLCB0
aGlzIGlzIGEgY29sbGlzaW9uIGJldHdlZW4gdGhlIG91dHB1dCBjb25zdHJhaW50IGFuZCB0aGUg
R09UCj4+Pj4gd2hpY2ggaXMgaGVsZCBpbiAlZWJ4IHdoZW4gY29tcGlsaW5nIHdpdGggLWZQSUMg
Zm9yIGxpYnJhcmllcy4KPj4+Pgo+Pj4+IFRoaXMgYWZmZWN0cyBhdCBsZWFzdCBHQ0MgNC45IGFz
IHNoaXBwZWQgaW4gRGViaWFuIEplc3NpZSwgYnV0IGV4cGVyaW1lbnRhbGx5Cj4+Pj4gaXMgZml4
ZWQgaW4gR0NDIDYgYW5kIGxhdGVyLiAgQ3VyaW91c2x5LCBpdCBvbmx5IGFmZmVjdHMgMzItYml0
IGJ1aWxkcy4KPj4+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnl0aGluZyBjdXJpb3VzIGhlcmU6
IFRoZSBHT1QgKG9yIGFjdHVhbGx5Cj4+PiAucm9kYXRhIGhlcmUpIGdldHMgYWNjZXNzZWQgYnkg
JXJpcC1yZWxhdGl2ZSBhZGRyZXNzaW5nIGluIHNtYWxsCj4+PiBtb2RlbCA2NC1iaXQgY29kZSwg
aWlyYy4KPj4gQWFoIC0gZ29vZCBwb2ludCwgYW5kIGFsc28gZXhwbGFpbnMgdGhlIG90aGVyIGNv
bmRpdGlvbmFscyBpbiBHQ0Mncwo+PiBpbnRyaW5zaWMgaGVhZGVyLgo+Pgo+PiBJJ2xsIHVwZGF0
ZSB0aGUgbG9naWMgdG8gY29wZSB3aXRoIHRoZSBsYXJnZXIgNjRiaXQgbW9kZWxzLgo+IERvIHlv
dSBuZWVkIHRvPyBUaGUgQUJJIHNwZWNpZmllcyB0aGF0IHRoZSBHT1QgcG9pbnRlciBsaXZlcwo+
IGluICVyMTUgaW4gdGhhdCBjYXNlLgoKSSd2ZSBjaGVja2VkLCBhbmQgZ2NjIDQuOSBjb21wbGFp
bnMgZXF1YWxseSB3aGVuIHVzaW5nIC1tY21vZGVsPWxhcmdlCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
