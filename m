From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Thu, 15 Nov 2018 22:51:16 +0200
Message-ID: <18432a31-4ba0-4913-2ccc-88c66037bc62@bitdefender.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <AD4830D4-4C9B-49FF-A33B-51BE88A5B6B7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmxX=N2=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gNObq-0004Zk-PF
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 20:51:30 +0000
In-Reply-To: <AD4830D4-4C9B-49FF-A33B-51BE88A5B6B7@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTUvMTggMTA6MjYgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gCj4gCj4+IE9uIE5v
diAxNCwgMjAxOCwgYXQgODo0MCBQTSwgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPiB3cm90ZToKPj4KPj4gV2hlbiBhbiBuZXcgYWx0cDJtIHZpZXcgaXMgY3JlYXRl
ZCB2ZXJ5IGVhcmx5IG9uIGd1ZXN0IGJvb3QsIHRoZQo+PiBkaXNwbGF5IHdpbGwgZnJlZXplIChh
bHRob3VnaCB0aGUgZ3Vlc3Qgd2lsbCBydW4gbm9ybWFsbHkpLiBUaGlzCj4+IG1heSBhbHNvIGhh
cHBlbiBvbiByZXNpemluZyB0aGUgZGlzcGxheS4gVGhlIHJlYXNvbiBpcyB0aGUgd2F5Cj4+IFhl
biBjdXJyZW50bHkgKG1pcyloYW5kbGVzIGxvZ2RpcnR5IFZHQTogaXQgaW50ZW50aW9uYWxseQo+
PiBtaXNjb25maWd1cmVzIFZHQSBwYWdlcyBzbyB0aGF0IHRoZXkgd2lsbCBmYXVsdC4KPj4KPj4g
VGhlIHByb2JsZW0gaXMgdGhhdCBpdCBvbmx5IGRvZXMgdGhpcyBpbiB0aGUgaG9zdCBwMm0uIE9u
Y2Ugd2UKPj4gc3dpdGNoIHRvIGEgbmV3IGFsdHAybSwgdGhlIG1pc2NvbmZpZ3VyZWQgZW50cmll
cyB3aWxsIG5vIGxvbmdlcgo+PiBmYXVsdCwgc28gdGhlIGRpc3BsYXkgd2lsbCBub3QgYmUgdXBk
YXRlZC4KPj4KPj4gVGhpcyBwYXRjaDoKPj4gKiB1cGRhdGVzIGVwdF9oYW5kbGVfbWlzY29uZmln
KCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0cDJtIGluc3RlYWQKPj4gIG9mIHRoZSBob3N0cDJtOwo+
PiAqIG1vZGlmaWVzIHAybV9jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwoKSwgcDJtX21lbW9yeV90
eXBlX2NoYW5nZWQKPj4gIGFuZCBwMm1fY2hhbmdlX3R5cGVfcmFuZ2UoKSB0byBwcm9wYWdhdGUg
dGhlaXIgY2hhbmdlcyB0byBhbGwKPj4gIHZhbGlkIGFsdHAybXMuCj4+Cj4+IFdpdGggdGhlIGlu
dHJvZHVjdGlvbiBvZiBhbHRwMm0gZmllbGRzIGluIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKCkK
Pj4gdGhlIHdob2xlIGZ1bmN0aW9uIGhhcyBiZWVuIHB1dCB1bmRlciBDT05GSUdfSFZNLgo+IAo+
IFNvcnJ5IOKAlCBhY3R1YWxseSwgSSB0aGluayB0aGVyZeKAmXMgeWV0IGFub3RoZXIgaXNzdWUg
bHVya2luZyBoZXJlOiAgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZSgpLiBJ4oCZbGwgcG9rZSBhcm91
bmQgYSBiaXQgbW9yZSB0b21vcnJvdy4KCk9LLCBJJ2xsIHdhaXQgZm9yIHlvdXIgcmVjb21tZW5k
YXRpb24gYmVmb3JlIHdvcmtpbmcgb24gdGhlIGxhc3QgcGF0Y2gKb2YgdGhlIHNlcmllcy4KCgpU
aGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
