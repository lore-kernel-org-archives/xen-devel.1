From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Tue, 30 Oct 2018 10:25:20 -0600
Message-ID: <5BD885F002000078001F66D3@prv1-mh.provo.novell.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHWpb-0003E4-9x
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:25:27 +0000
In-Reply-To: <1540816837-8936-4-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjEwLjE4IGF0IDEzOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gQEAgLTMxNiw2ICszMzksMjIgQEAgdm9pZCBwMm1fbWVtb3J5X3R5cGVfY2hhbmdlZChz
dHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgfQo+ICB9Cj4gIAo+ICt2b2lkIHAybV9tZW1vcnlfdHlw
ZV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4gK3sKPiArICAgIF9tZW1vcnlfdHlwZV9jaGFu
Z2VkKHAybV9nZXRfaG9zdHAybShkKSk7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX0hWTQo+ICsgICAg
aWYgKCB1bmxpa2VseShhbHRwMm1fYWN0aXZlKGQpKSApCj4gKyAgICB7Cj4gKyAgICAgICAgdW5z
aWduZWQgaW50IGk7Cj4gKwo+ICsgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTUFYX0FMVFAyTTsg
aSsrICkKPiArICAgICAgICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2ldICE9IG1mbl94
KElOVkFMSURfTUZOKSApCj4gKyAgICAgICAgICAgICAgICBfbWVtb3J5X3R5cGVfY2hhbmdlZChk
LT5hcmNoLmFsdHAybV9wMm1baV0pOwo+ICsgICAgfQo+ICsjZW5kaWYKPiArfQoKSG1tLCBJJ20g
cHV6emxlZCBieSB0aGUgI2lmZGVmIHBsYWNlbWVudC4gV2VpLCBkaWRuJ3Qgd2Ugc2V0dGxlIHRo
YXQKdGhpcyBjb2RlIGlzIEhWTSBvbmx5IGFsdG9nZXRoZXI/CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
