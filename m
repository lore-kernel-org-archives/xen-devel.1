From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/vvmx: Simplify per-CPU memory
 allocations
Date: Sat, 11 May 2019 00:02:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A2B8@SHSMSX104.ccr.corp.intel.com>
References: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFTM-0008Ly-4C
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:02:40 +0000
In-Reply-To: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogRnJpZGF5LCBBcHJpbCAyNiwgMjAxOSAxMjo0NSBBTQ0KPiANCj4gICogVXNlIFhG
UkVFKCkgaW5zdGVhZCBvZiBvcGVuY29kaW5nIGl0IGluIG52bXhfY3B1X2RlYWQoKQ0KPiAgKiBB
dm9pZCByZWR1bmRhbnQgZXZhbHVhdGlvbnMgb2YgcGVyX2NwdSgpDQo+ICAqIERvbid0IGFsbG9j
YXRlIHZ2bWNzX2J1ZiBhdCBhbGwgaWYgaXQgaXNuJ3QgZ29pbmcgdG8gYmUgdXNlZC4gIEl0IGlz
IG5ldmVyDQo+ICAgIHRvdWNoZWQgb24gaGFyZHdhcmUgbGFja2luZyB0aGUgVk1DUyBTaGFkb3dp
bmcgZmVhdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
