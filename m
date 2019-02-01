From: Juergen Gross <jgross@suse.com>
Subject: Scheduling and the periodic timer
Date: Fri, 1 Feb 2019 08:26:56 +0100
Message-ID: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpTE5-00018L-L2
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 07:27:01 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgd29ya2luZyBvbiBteSBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzIEkgc3R1bWJsZWQgb3Zl
ciB0aGUgcGVyaW9kaWMKdGltZXIuIENvdWxkIGl0IGJlIHRoaXMgdGltZXIgbmV2ZXIgd29ya2Vk
IGNvcnJlY3RseT8KCldoZW4gdGhlIHZjcHUgd2l0aCBhbiBhY3RpdmUgcGVyaW9kaWMgdGltZXIg
aXMgcnVubmluZyBldmVyeXRoaW5nIHNlZW1zCnRvIGJlIGZpbmUuIEJ1dCB3aGVuIG5vdCBydW5u
aW5nIHRoZSB0aW1lciBpcyBzdG9wcGVkIGluIHNjaGVkdWxlKCkuIFNvCmEgdmNwdSBnb2luZyB0
byBpZGxlIHJlbHlpbmcgdG8gYmUgd29rZW4gdXAgYnkgdGhlIHBlcmlvZGljIHRpbWVyIHdpbGwK
cmVtYWluIHNsZWVwaW5nIHVudGlsIGFub3RoZXIgZXZlbnQgaXMgaGFwcGVuaW5nLiBUaGUgcGVy
aW9kaWMgdGltZXIKd29uJ3QgZmlyZSBhcyBpdCBpcyBzdG9wcGVkLgoKVGhlIHBlcmlvZGljIHRp
bWVyIGlzIHVzZWQgdmlhIFZDUFVPUF9zZXRfcGVyaW9kaWNfdGltZXIgb25seSwgYW5kCnRvZGF5
J3MgTGludXgga2VybmVsIGlzbid0IHVzaW5nIGl0IGF0IGFsbC4gU28gSSBndWVzcyB0aGlzIHRp
bWVyIG5vdApyZWFsbHkgd29ya2luZyBhcyBpdCBzaG91bGQgaXMgbm8gYmlnIGlzc3VlLgoKSSBq
dXN0IHdhbnRlZCB0byBtZW50aW9uIHRoYXQgZmFjdCwgbWF5YmUgc29tZW9uZSBpcyBrZWVuIHJl
cGFpcmluZwp0aGlzIGlzc3VlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
