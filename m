From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
Date: Tue, 9 Apr 2019 10:05:02 +0100
Message-ID: <ac820a30-93c8-802a-8d80-4f5f36092b35@citrix.com>
References: <1554779388-3769-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rl/Z=SL=citrix.com=prvs=995435944=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hDmgp-0002ku-UV
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:05:11 +0000
In-Reply-To: <1554779388-3769-1-git-send-email-fionali-oc@zhaoxin.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: FionaLi-oc <fionali-oc@zhaoxin.com>, xen-devel@lists.xenproject.org
Cc: cobechen@zhaoxin.com, wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOSAwNDowOSwgRmlvbmFMaS1vYyB3cm90ZToKPiBXaGVuIGV4ZWN1dGluZyBT
WVNFWElUIG9yIFNZU0VOVFJZIGluIFpoYW94aW4gQ1BVLCBDUFUgbmVlZHMgdG8KPiBzYXZlIG9y
IHJlc3RvcmUgYSBzZXQgb2YgTVNScy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZpb25hTGktb2MgPGZp
b25hbGktb2NAemhhb3hpbi5jb20+CgpUaGVzZSBjaGFuZ2VzIGxvb2sgZmluZSBvdmVyYWxsLCBi
dXQgcGxlYXNlIHJlYmFzZSB0aGVtIG9udG8gdGhlIHN0YWdpbmcKYnJhbmNoLgoKSW4gcGFydGlj
dWxhciwKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRp
ZmY7aD0wY2QwNzQxNDRjYmIzMmRlNTNlOThlYWFkN2QwZWNkOTI1OWYyMTliCndoaWNoIGlzIGEg
cmVjZW50IHBhdGNoIG9mIG1pbmUgKHRvIGhlbHAgSHlnb24pIG91Z2h0IHRvIHNpbXBsaWZ5IHRo
ZSBwYXRjaC4KClRoYW5rcywKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
