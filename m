From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/9] vm_event: Define VM_EVENT type
Date: Mon, 3 Jun 2019 16:22:19 -0600
Message-ID: <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXvM8-0005ic-Pv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:23:04 +0000
Received: by mail-wr1-f44.google.com with SMTP id b18so13692481wrq.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 15:22:58 -0700 (PDT)
In-Reply-To: <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiA+ICAvKiBYRU5fRE9NQ1RMX21lbV9zaGFyaW5nX29wLgo+ID4gLSAqIFRoZSBDT05UUk9MIHN1
Yi1kb21jdGwgaXMgdXNlZCBmb3IgYnJpbmd1cC90ZWFyZG93bi4gKi8KPiA+ICsgKiBUaGUgQ09O
VFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJyaW5ndXAvdGVhcmRvd24uCj4gPiArICogUGxl
YXNlIG5vdGUgdGhhdCBtZW0gc2hhcmluZyBjYW4gYmUgdHVybmVkIG9uICp3aXRob3V0KiBzZXR0
aW5nLXVwIHRoZQo+ID4gKyAqIGNvcnJlc3BvbmRpbiByaW5nCj4gPiArICovCj4KPiBBcyBhIHRh
bmdlbnQsIGl0IGNhbj8gaG93PyAgKEknbSBlbnRpcmVseSBwcmVwYXJlZCB0byBiZWxpZXZlIHRo
YXQgdGhpcwo+IGlzIGhvdyB0aGUgY29kZSBjdXJyZW50bHkgd29ya3MsIGJ1dCBJIGNhbid0IHNl
ZSBob3cgc3VjaCBhIHNldHVwIHdvdWxkCj4gcGxhdXNpYmx5IHdvcmsuKQoKVGhlIHZtX2V2ZW50
IHJpbmcgZm9yIG1lbV9zaGFyaW5nIGlzIG9ubHkgdXNlZCB0byBjb21tdW5pY2F0ZQpvdXQtb2Yt
bWVtb3J5IGNvbmRpdGlvbiB0byBhbiBleHRlcm5hbCBsaXN0ZW5lci4gSSB0aGluayBpdCdzIG9u
bHkKdXNlZnVsIGZvciBsb2dnaW5nIHNpbmNlIHRoZSBsaXN0ZW5lciB3b3VsZG4ndCByZWFsbHkg
YmUgaW4gYSBwb3NpdGlvbgp0byB0cnkgdG8gIm1ha2Ugc3BhY2UiIGZvciB0aGUgZmF1bHRpbmcg
ZG9tYWluIGFuZCBpdCB3b3VsZCBnZXQKZGVzdHJveWVkIGFmdGVyIHRoZSBtZXNzYWdlIGlzIHNl
bnQuIEluIGFueSBjYXNlLCB0aGVyZSBpc24ndCBhbnkKZG9jdW1lbnRhdGlvbiBmb3IgaG93IGl0
IHdhcyBpbnRlbmRlZCB0byBiZSB1c2VkIHNvIHRoaXMgaXMganVzdCBteQpndWVzcy4KClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
