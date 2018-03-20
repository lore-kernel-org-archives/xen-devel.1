From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vtx: Introduce a typed union for CR
 access exit information
Date: Tue, 20 Mar 2018 09:06:16 -0600
Message-ID: <5AB1317802000078001B3FED@prv-mh.provo.novell.com>
References: <1521115652-16228-1-git-send-email-andrew.cooper3@citrix.com>
 <5AB0F5C302000078001B3DEE@prv-mh.provo.novell.com>
 <22e5c411-2d77-8172-400a-4108b4edee11@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <22e5c411-2d77-8172-400a-4108b4edee11@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDE1OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMDMvMTggMTA6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNS4w
My4xOCBhdCAxMzowNywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gK3R5
cGVkZWYgdW5pb24gY3JfYWNjZXNzX3F1YWwgewo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIHJhdzsK
Pj4+ICsgICAgc3RydWN0IHsKPj4+ICsgICAgICAgIHVpbnQxNl90IGNyOjQsCj4+PiArICAgICAg
ICAgICAgICAgICBhY2Nlc3NfdHlwZToyLCAgLyogVk1YX0NSX0FDQ0VTU19UWVBFXyogKi8KPj4+
ICsgICAgICAgICAgICAgICAgIGxtc3dfb3BfdHlwZToxLCAvKiAwID0+IHJlZywgMSA9PiBtZW0g
ICAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgOjEsCj4+PiArICAgICAgICAgICAgICAgICBncHI6
NCwKPj4+ICsgICAgICAgICAgICAgICAgIDo0Owo+Pj4gKyAgICAgICAgdWludDE2X3QgbG1zd19k
YXRhOwo+Pj4gKyAgICAgICAgdWludDMyX3QgOjMyOwo+PiBTdHJpY3RseSBzcGVha2luZyB0aGlz
IGRvZXNuJ3QgYmVsb25nIGhlcmUsIGFzIGl0IGRvZXNuJ3QgZXhpc3QgZm9yCj4+IDMyLWJpdCBW
TVggaW1wbGVtZW50YXRpb25zLgo+IAo+IEl0IGlzIG9ubHkgaGVyZSB0byBrZWVwIGNsYW5nIGhh
cHB5LiAgU2VlIGMvcyBhYzZlN2ZkN2E0ODIKCk9oLCBJIGRpZG4ndCByZWNhbGwgdGhhdC4KCj4g
QXMgYW4gYWx0ZXJuYXRpdmUsIHdlIGNvdWxkIHNlZSBhYm91dCBub3QgdXNpbmcgdHJhbnNwYXJl
bnQgdW5pb25zLCBhbmQKPiBleHBsaWNpdGx5IGNhc3RpbmcgaW4gdGhlIGZ1bmN0aW9uIGNhbGxz
LgoKTGV0J3MgcmF0aGVyIG5vdCAtIHRyYW5zcGFyZW50IHVuaW9ucyBhcmUgcXVpdGUgbmljZSBh
biBhaWQgdG8gYXZvaWQKY2FzdHMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
