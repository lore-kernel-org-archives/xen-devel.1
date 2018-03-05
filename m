From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/20] x86emul: support most remaining
	AVX2 insns
Date: Mon, 5 Mar 2018 13:39:45 +0000
Message-ID: <41511c2b-8fd1-222e-f6ee-8da280004876@citrix.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
 <5A96B57302000078001ACB87@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fc0z=f3=citrix.com=prvs=595eaad67=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1esqLt-0001VQ-On
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:40:29 +0000
In-Reply-To: <5A96B57302000078001ACB87@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTI6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgoKWW91J3JlIG1pc3NpbmcgYSBT
b0Igb24gdGhpcyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCwgYnV0IGFzc3VtaW5nIHRoYXQKZ2V0cyBm
aXhlZCwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiBAQCAtNzMwNiw2ICs3MzI1
LDExIEBAIHg4Nl9lbXVsYXRlKAo+ICAgICAgICAgIG9wX2J5dGVzID0gOCA8PCB2ZXgubDsKPiAg
ICAgICAgICBnb3RvIHNpbWRfMGZfeW1tOwo+ICAKPiArICAgIGNhc2UgWDg2RU1VTF9PUENfVkVY
XzY2KDB4MGYzOCwgMHgxNik6IC8qIHZwZXJtcHMgeW1tL20yNTYseW1tLHltbSAqLwo+ICsgICAg
Y2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjM4LCAweDM2KTogLyogdnBlcm1kIHltbS9tMjU2
LHltbSx5bW0gKi8KCkl0IHNlZW1zIGVzcGVjaWFsbHkgb2RkIHRoYXQgdGhlc2UgZG9uJ3QgY29w
ZSB3aXRoIHZleC5sIG9yIHZleC53LsKgIEkKY2FuIG9ubHkgZ3Vlc3MgdGhhdCBpdCBkb3duIHRv
IGEgbGltaXRhdGlvbiBpbiB0aGUgdmVjdG9yIHBpcGVsaW5lIHdoaWNoCndhc24ndCByZXNvbHZl
ZCB1bnRpbCBBVlgtNTEyIHdhcyBpbnRyb2R1Y2VkLgoKfkFuZHJldwoKPiArICAgICAgICBnZW5l
cmF0ZV9leGNlcHRpb25faWYoIXZleC5sIHx8IHZleC53LCBFWENfVUQpOwo+ICsgICAgICAgIGdv
dG8gc2ltZF8wZl9hdngyOwo+ICsKPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYz
OCwgMHgyMCk6IC8qIHZwbW92c3hidyB4bW0vbWVtLHt4LHl9bW0gKi8KPiAgICAgIGNhc2UgWDg2
RU1VTF9PUENfVkVYXzY2KDB4MGYzOCwgMHgyMSk6IC8qIHZwbW92c3hiZCB4bW0vbWVtLHt4LHl9
bW0gKi8KPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzOCwgMHgyMik6IC8qIHZw
bW92c3hicSB4bW0vbWVtLHt4LHl9bW0gKi8KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
