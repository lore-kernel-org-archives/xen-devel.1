From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 28/50] x86emul: support AVX512F floating
 point manipulation insns
Date: Wed, 29 May 2019 05:51:08 -0700
Message-ID: <d516dd65-ed3c-0817-26ec-873315fecce3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84C5020000780021F242@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVy32-0000fe-Kx
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 12:51:16 +0000
In-Reply-To: <5C8B84C5020000780021F242@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTk2ODEsNiArOTY5
NiwyMSBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICBvcF9ieXRlcyA9IDQ7Cj4gICAgICAgICAg
Z290byBzaW1kX2ltbThfem1tOwo+ICAKPiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82Nigw
eDBmM2EsIDB4MjYpOiAvKiB2Z2V0bWFudHB7cyxkfSAkaW1tOCxbeHl6XW1tL21lbSxbeHl6XW1t
e2t9ICovCj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNhLCAweDU0KTogLyog
dmZpeHVwaW1tcHtzLGR9ICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAqLwo+
ICsgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKGF2eDUxMmYpOwo+ICsgICAgICAgIGlm
ICggZWEudHlwZSAhPSBPUF9SRUcgfHwgIWV2ZXguYnJzICkKPiArICAgICAgICAgICAgYXZ4NTEy
X3ZsZW5fY2hlY2soZmFsc2UpOwo+ICsgICAgICAgIGdvdG8gc2ltZF9pbW04X3ptbTsKPiArCj4g
KyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNhLCAweDI3KTogLyogdmdldG1hbnRz
e3MsZH0gJGltbTgseG1tL21lbSx4bW0seG1te2t9ICovCj4gKyAgICBjYXNlIFg4NkVNVUxfT1BD
X0VWRVhfNjYoMHgwZjNhLCAweDU1KTogLyogdmZpeHVwaW1tc3tzLGR9ICRpbW04LHhtbS9tZW0s
eG1tLHhtbXtrfSAqLwo+ICsgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKGF2eDUxMmYp
Owo+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihlYS50eXBlICE9IE9QX1JFRyAmJiBl
dmV4LmJycywgRVhDX1VEKTsKCldoeSB0aGUgZWEudHlwZSAhPSBPUF9SRUcgcmVzdHJpY3Rpb24/
wqAgVGhlc2UgZm91ciBpbnN0cnVjdGlvbnMgZG8gdGFrZQptZW1vcnkgb3BlcmFuZHMuCgp+QW5k
cmV3Cgo+ICsgICAgICAgIGlmICggIWV2ZXguYnJzICkKPiArICAgICAgICAgICAgYXZ4NTEyX3Zs
ZW5fY2hlY2sodHJ1ZSk7Cj4gKyAgICAgICAgZ290byBzaW1kX2ltbThfem1tOwo+ICsKPiAgICAg
IGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHgzMCk6IC8qIGtzaGlmdHJ7Yix3fSAk
aW1tOCxrLGsgKi8KPiAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYzYSwgMHgzMik6
IC8qIGtzaGlmdGx7Yix3fSAkaW1tOCxrLGsgKi8KPiAgICAgICAgICBpZiAoICF2ZXgudyApCj4K
Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
