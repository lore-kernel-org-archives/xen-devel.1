From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 11/18] argo: implement the register op
Date: Thu, 20 Dec 2018 11:20:27 +0000
Message-ID: <e15524af-c824-33da-e4f2-1f451a1bfca6@arm.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-12-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIHg=O5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZwNW-0008O5-BN
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 11:20:34 +0000
In-Reply-To: <1545287955-27684-12-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQ2hyaXN0b3BoZXIsCgpPbiAxMi8yMC8xOCA2OjM5IEFNLCBDaHJpc3RvcGhlciBDbGFyayB3
cm90ZToKPiBVc2VkIGJ5IGEgZG9tYWluIHRvIHJlZ2lzdGVyIGEgcmVnaW9uIG9mIG1lbW9yeSBm
b3IgcmVjZWl2aW5nIG1lc3NhZ2VzIGZyb20KPiBlaXRoZXIgYSBzcGVjaWZpZWQgb3RoZXIgZG9t
YWluLCBvciwgaWYgc3BlY2lmeWluZyBhIHdpbGRjYXJkLCBhbnkgZG9tYWluLgo+IAo+IFRoaXMg
b3BlcmF0aW9uIGNyZWF0ZXMgYSBtYXBwaW5nIHdpdGhpbiBYZW4ncyBwcml2YXRlIGFkZHJlc3Mg
c3BhY2UgdGhhdAo+IHdpbGwgcmVtYWluIHJlc2lkZW50IGZvciB0aGUgbGlmZXRpbWUgb2YgdGhl
IHJpbmcuIEluIHN1YnNlcXVlbnQgY29tbWl0cywKPiB0aGUgaHlwZXJ2aXNvciB3aWxsIHVzZSB0
aGlzIG1hcHBpbmcgdG8gY29weSBkYXRhIGZyb20gYSBzZW5kaW5nIGRvbWFpbiBpbnRvCj4gdGhp
cyByZWdpc3RlcmVkIHJpbmcsIG1ha2luZyBpdCBhY2Nlc3NpYmxlIHRvIHRoZSBkb21haW4gdGhh
dCByZWdpc3RlcmVkIHRoZQo+IHJpbmcgdG8gcmVjZWl2ZSBkYXRhLgo+IAo+IEluIHRoaXMgY29k
ZSwgdGhlIHAybSB0eXBlIG9mIHRoZSBtZW1vcnkgc3VwcGxpZWQgYnkgdGhlIGd1ZXN0IGZvciB0
aGUgcmluZwo+IG11c3QgYmUgcDJtX3JhbV9ydywgd2hpY2ggaXMgYSBjb25zZXJ2YXRpdmUgY2hv
aWNlIG1hZGUgdG8gZGVmZXIgdGhlIG5lZWQgdG8KPiByZWFzb24gYWJvdXQgdGhlIG90aGVyIHAy
bSB0eXBlcyB3aXRoIHRoaXMgY29tbWl0Lgo+IAo+IHhlbl9hcmdvX3BhZ2VfZGVzY3JfdCB0eXBl
IGlzIGludHJvZHVjZWQgYXMgYSBwYWdlIGRlc2NyaXB0b3IsIHRvIGNvbnZleQo+IGJvdGggdGhl
IHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIHN0YXJ0IG9mIHRoZSBwYWdlIGFuZCBpdHMgZ3JhbnVs
YXJpdHkuIFRoZQo+IHNtYWxsZXN0IGdyYW51bGFyaXR5IHBhZ2UgaXMgYXNzdW1lZCB0byBiZSA0
MDk2IGJ5dGVzIGFuZCB0aGUgbG93ZXIgdHdlbHZlCj4gYml0cyBvZiB0aGUgdHlwZSBhcmUgdXNl
ZCBmb3IgaW5kaWNhdGUgYW4gZW51bWVyYXRlZCBwYWdlIHNpemUuCgpJIGhhdmVuJ3Qgc2VlbiBh
bnkgcmVwbHkgZnJvbSB5b3Ugb24gbXkgY29uY2VybiB3aXRoIHRoaXMgYXBwcm9hY2ggKHNlZSAK
WzFdKS4KCkZvciBjb252ZW5pZW5jZSwgSSB3aWxsIGR1cGxpY2F0ZSB0aGUgbWVzc2FnZSBoZXJl
LgoKSWYgeW91IGxldCB0aGUgdXNlciB0aGUgY2hvaWNlIG9mIHRoZSBncmFudWxhcml0eSwgdGhl
biwgSSBiZWxpZXZlLCB5b3UgCndpbGwgcHJldmVudCB0aGUgaHlwZXJ2aXNvciB0byBkbyBzb21l
IG9wdGltaXphdGlvbi4KCkZvciBpbnN0YW5jZSwgaWYgdGhlIGd1ZXN0IHN1cHBsaWVzIG9ubHkg
NEtCIHBhZ2UgYnV0IHRoZSBoeXBlcnZpc29yIGlzIAo2NEtCLiBUaGVyZSBhcmUgbm8gd2F5IHRv
IGVhc2lseSBtYXAgdGhlbSBjb250aWd1b3VzbHkgaW4gdGhlIGh5cGVydmlzb3IgCihlLmcgdXNp
bmcgdm1hcCkuCgpJcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uIHRvIGFsbG93IHRoZSByaW5n
IGJ1ZmZlciB0byBiZSAKbm9uLWNvbnRpZ3VvdXMgaW4gdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJl
c3M/CgpEZXBlbmRpbmcgb24gdGhlIGFuc3dlciwgdGhlcmUgYXJlIGRpZmZlcmVudCB3YXkgdG8g
aGFuZGxlIHRoYXQ6CjEpIFJlcXVlc3QgdGhlIGd1ZXN0IHRvIGFsbG9jYXRlIG1lbW9yeSB1c2lu
ZyA2NEtCIChvbiBBcm0pIGNodW5rIGFuZCAKcGFzcyB0aGUgYmFzZSBhZGRyZXNzIGZvciBlYWNo
IGNodW5rCjIpIFJlcXVlc3QgdGhlIGd1ZXN0IHRvIGFsbG9jYXRlIGNvbnRpZ3VvdXNseSB0aGUg
YnVmZmVyIGFuZCBwYXNzIHRoZSAKYmFzZSBhZGRyZXNzIGFuZCBzaXplCgpDaGVlcnMsCgpbMV0g
aHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNn
MDEwMzguaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
