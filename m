From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmx: Fixup removals from MSR load-lists
Date: Thu, 4 Apr 2019 15:45:08 +0100
Message-ID: <8ab56d9d-0218-7688-e283-ac8d82d5a55a@citrix.com>
References: <1554388929-20127-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1MX=SG=citrix.com=prvs=990a9ef02=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hC3kT-0007nM-Px
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:53:49 +0000
In-Reply-To: <1554388929-20127-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, jun.nakajima@intel.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMjAxOSAxNTo0MiwgSWdvciBEcnV6aGluaW4gd3JvdGU6CgpJJ2QgYWRkICJlbnRy
aWVzIiB0byB0aGUgc3ViamVjdCwgd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0LgoKPiBDb21t
aXQgZmQzMmRjZmUgKCJ4ODYvdm14OiBEb24ndCBsZWFrIEVGRVIuTlhFIGludG8gZ3Vlc3QgY29u
dGV4dCIpCj4gaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gb24gSGFycGVydG93biBhbmQgZWFybGll
ciBjb3JlcyAoR2VuIDEgVlQteCkKPiB3aGVyZSBhcyBzb29uIGFzIGd1ZXN0IEVGRVIgYmVjb21l
cyBlcXVhbCB0byBYZW4gRUZFUgo+IChhbG1vc3QgYW55IDY0LWJpdCBWTSkgc3RhbGUgdmVyc2lv
biBvZiBFRkVSIGlzIGluY29ycmVjdGx5Cj4gbG9hZGVkIGludG8gYSBndWVzdCBjYXVzaW5nIGFs
bW9zdCBpbW1lZGlhdGUgZ3Vlc3QgZmFpbHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1
emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
