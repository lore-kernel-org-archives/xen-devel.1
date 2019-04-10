From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [OSSTEST PATCH 55/62] make-flight: shadow test:
 Disable kpti in guests
Date: Wed, 10 Apr 2019 15:33:26 +0100
Message-ID: <76415ebc-6540-4ea0-d1f4-023a6763cba2@citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-56-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HBqT=SM=citrix.com=prvs=996c6fe0e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEEmK-0007e9-NC
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:04:44 +0000
In-Reply-To: <20190410142408.22848-56-ian.jackson@eu.citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOSAxNToyNCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2luY2UgU3BlY3RyZS9N
ZWx0ZG93biwgc2hhZG93IGhhcyBiZWVuIGEgbG90IHNsb3dlciwgZXNwZWNpYWxseSB3aXRoCj4g
S1BUSSBpbiB0aGUgZ3Vlc3QuICBFbXBpcmljYWxseSwgdG9vIHNsb3cgKHdpdGggdGhlIGtlcm5l
bCBmcm9tIERlYmlhbgo+IHN0cmV0Y2gpLgoKVGhlIHNwZWVkIG9mIHNoYWRvdyBwYWdldGFibGVz
IGhhc24ndCBjaGFuZ2VkIC0gSSBkb24ndCB0aGluayB3ZSBldmVuCnRvdWNoZWQgdGhlIHNoYWRv
dyBjb2RlIGF0IGFsbCBmb3IgWFNBLTI1NC4KClRoZSBwcm9ibGVtIGlzIHRoZSBjaGFuZ2UgaW4g
Z3Vlc3QgYmVoYXZpb3VyIGFzIGEgY29uc2VxdWVuY2Ugb2YgbmVlZGluZwpLUFRJIGZvciBhIE1l
bHRkb3duIG1pdGlnYXRpb24uCgpUaGUgZ3Vlc3Qgbm93IGZsdXNoZXMgaXRzIHBhZ2V0YWJsZXMg
b24gZXZlcnkKc3lzY2FsbC9pbnRlcnJ1cHQvZXhjZXB0aW9uIHJhdGhlciB0aGFuIG9uY2Ugb24g
YSBwcm9jZXNzPT5wcm9jZXNzCmNvbnRleHQgc3dpdGNoLCB3aGljaCBpcyB3aHkgcnVubmluZyBh
IGd1ZXN0IHVzaW5nIEtQVEkgaW4gc2hhZG93IG1vZGUKaXMgYm9hcmRlcmxpbmUgdW51c2FibGUu
CgpUaGUgYWN0dWFsIGNoYW5nZSB0byB1c2Ugbm9wdGkgbG9va3MgZmluZS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
