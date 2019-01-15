From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 00/14] Argo: hypervisor-mediated
 interdomain communication
Date: Tue, 15 Jan 2019 17:34:24 +0100
Message-ID: <20190115163259.44yef6hjpd3mvl6p@mac>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjRgg-0004j8-5G
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 16:35:38 +0000
Content-Disposition: inline
In-Reply-To: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDE6Mjc6MzJBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gVmVyc2lvbiBmb3VyIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLgo+IAo+ICogQ2hh
bmdlcyBhcmUgcHJpbWFyaWx5IGFkZHJlc3NpbmcgZmVlZGJhY2sgZnJvbSB0aGUgdjMgc2VyaWVz
IHJldmlld3MuCj4gICBNYW55IHBvaW50cyBub3RlZCBvbiB0aGUgaW52aWRpZHVhbCBjb21taXQg
cG9zdHMuCj4gCj4gKiBSZWdpc3RlciByaW5nIGludGVyZmFjZXMgdXNlcyBYZW4gZ2ZucyBhcyBw
YWdlIGlkZW50aWZpZXJzLAo+ICAgYW5kIHRoZSBhcmd1bWVudHMgbm8gbG9uZ2VyIHNwZWNpZnkg
cGFnZSBncmFudWxhcml0eS4KPiAKPiAqIE11bHRpLWxldmVsIGxvY2sgdmFsaWRhdGlvbiBtYWNy
b3MgZGVmaW5lZCBhbmQgYXBwbGllZC4KPiAgIExvY2tzIHJlbmFtZWQgdG8gaW1wcm92ZSByZWFk
YWJpbGl0eS4KPiAKPiAqIEh5cGVyY2FsbCBhcmd1bWVudCBzdHJ1Y3QgY2hlY2tpbmcgaXMgZm9s
ZGVkIGlubGluZSBpbnRvIHRoZSBzZXJpZXMsCj4gICBjaGVja3MgYXBwbGllZCBhcyB0eXBlcyBh
cmUgaW50cm9kdWNlZC4KPiAKPiAqIGFyZ28tbWFjIHN0cmluZyBib290IHBhcmFtZXRlciBjaGFu
Z2VkIHRvIGFyZ28tbWFjLXBlcm1pc3NpdmUgYm9vbGVhbgo+IAo+IEZlZWRiYWNrIGl0ZW1zIHRo
YXQgYXJlIHJlbWFpbmluZyB0byBiZSBhZGRyZXNzZWQgaGF2ZSBiZWVuIG5vdGVkIHdpdGgKPiBj
b21tZW50cyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGF0IHRoZSBsb2NhdGlvbiBpbiB0aGUg
Y29kZS4KClRoYW5rcy4gSSd2ZSBtYWRlIHNvbWUgY29tbWVudHMgb24gdGhlIHBhdGNoZXMsIGJ1
dCBvdmVyYWxsIHRoaXMgTEdUTS4KVGhhbmtzIGZvciBpbXByb3ZpbmcgdGhlIGxvY2tpbmcgbmFt
ZXMgYW5kIHRoZSBjb21tZW50cy4KCkkgdGhpbmsgbXkgb25seSByZXF1ZXN0IHdvdWxkIGJlIHRv
IGFkZCB0aGUgdXNhZ2Ugb2Ygdm1hcCBpbiBvcmRlciB0bwptYXAgdGhlIHJpbmdzIGluIGEgRklY
TUUsIHNvIGl0J3Mgbm90IGZvcmdvdHRlbi4gVGhhdCBjYW4gYmUgbGlrZWx5CmRvbmUgYWZ0ZXIg
NC4xMiBpZiB0aGVyZSBhcmUgdGltZSBjb25zdHJhaW5zIChhbmQgbWF5YmUgbW9yZQppbXBvcnRh
bnQgaXNzdWVzIHRvIHNvbHZlKS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
