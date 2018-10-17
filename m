From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 17 Oct 2018 14:30:35 +0100
Message-ID: <7cc2d3bf-a1dc-b803-cfec-8dd8020b3b10@citrix.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
 <ac06731a-a44c-fce7-0638-eecf68579176@citrix.com>
 <d0358c5a-1f63-e64c-d988-d5475caa766f@bitdefender.com>
 <5BB62FA902000078001EE6BC@prv1-mh.provo.novell.com>
 <d66b5a9f-4e88-7d67-9238-3f813e665d1d@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwmr=m5=citrix.com=prvs=821ff731b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gClue-00088Z-4h
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 13:31:00 +0000
In-Reply-To: <d66b5a9f-4e88-7d67-9238-3f813e665d1d@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMTAvMTggMTQ6MjYsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiBPbiAxMC80LzE4IDY6
MjAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBSb2dlciByZWNlbnRseSBoYXMgcG9zdGVkIGEg
cGF0Y2ggYWRkaW5nIHJhbmdlc2V0X21lcmdlKCksIHdoaWNoIEkgdGhpbmsKPj4gaXMgbW9yZSBn
ZW5lcmFsIHRoYW4geW91ciByYW5nZXNldF9jb3B5KCkuIFRoYXQgc2FpZCwgSSdtIGluIG5vIHdh
eQo+PiBjb252aW5jZWQgY29weWluZyAoYW5kIHRoZW4ga2VlcGluZyBpbiBzeW5jKSB0aGUgcmFu
Z2Ugc2V0cyBhY3Jvc3MgdGhlCj4+IGFsdHAybS1zIGlzIHRoZSBiZXN0IGFwcHJvYWNoLiBJdCBt
YXkgd2VsbCBiZSB0aGF0IHRoZSBvcHRpbWFsIHNvbHV0aW9uIGlzCj4+IHNvbWV3aGVyZSBpbiB0
aGUgbWlkZGxlIGJldHdlZW4gc2hhcmluZyBldmVyeXRoaW5nIGFuZCBjb3B5aW5nCj4+IGV2ZXJ5
dGhpbmcuCj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gZ2V0IFJvZ2VyJ3MgcGF0Y2ggaW50byBz
dGFnaW5nPwo+Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE4LTA2L21zZzAxMzMxLmh0bWwKPgo+IEl0IGxvb2tzIHNpbXBsZSBlbm91Z2gg
YW5kIGl0IGhhcyBhbHJlYWR5IGFja2VkIGJ5IFdlaS4KCkxvb2tzIGdvb2QgZW5vdWdoIHRvIG1l
LsKgIFB1c2hlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
