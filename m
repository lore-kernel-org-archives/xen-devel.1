From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 17:48:59 +0000
Message-ID: <2a41fbd5-c90b-1e2a-3aeb-15308ea5f254@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5C9E3C3D0200007800222FB0@suse.com>
 <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
 <2d8735fa29e3c7add47b8e4c467760bfffc90b09.camel@suse.com>
 <63d8e13a-2dee-916a-61d4-7d69c7bb0a4d@suse.com>
 <CANmpu8WGcEfztp2VNAKKV+Uz2cUqw6yzweJU-19++cNdKRZ3tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9vcm-0002dc-Ns
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:49:04 +0000
In-Reply-To: <CANmpu8WGcEfztp2VNAKKV+Uz2cUqw6yzweJU-19++cNdKRZ3tA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rian Quinn <rianquinn@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNzozOSwgUmlhbiBRdWlubiB3cm90ZToKPiBPdXQgb2YgY3VyaW9zaXR5
LCBoYXMgdGhlcmUgYmVlbiBhbnkgcmVzZWFyY2ggZG9uZSBvbiB3aGV0aGVyIG9yIG5vdAo+IGl0
IG1ha2VzIG1vcmUgc2Vuc2UgdG8ganVzdCBkaXNhYmxlIENQVSB0aHJlYWRpbmcgd2l0aCByZXNw
ZWN0IHRvCj4gb3ZlcmFsbCBwZXJmb3JtYW5jZT8gSW4gc29tZSBvZiB0aGUgdGVzdGluZyB0aGF0
IHdlIGRpZCB3aXRoIE9wZW5YVCwKPiB3ZSBub3RpY2VkIGluIHNvbWUgb2Ygb3VyIHRlc3RzIGEg
cGVyZm9ybWFuY2UgaW5jcmVhc2Ugd2hlbgo+IGh5cGVydGhyZWFkaW5nIHdhcyBkaXNhYmxlZC4g
SSB3b3VsZCBiZSBjdXJpb3VzIHdoYXQgb3RoZXIgcmVzZWFyY2gKPiBoYXMgYmVlbiBkb25lIGlu
IHRoaXMgcmVnYXJkLgo+Cj4gRWl0aGVyIHdheSwgaWYgdGhyZWFkaW5nIGlzIGVuYWJsZWQsIGdy
b3VwaW5nIHVwIHRocmVhZHMgbWFrZXMgYSBsb3QKPiBvZiBzZW5zZSBXUlQgc29tZSBvZiB0aGUg
cmVjZW50IHNlY3VyaXR5IGlzc3VlcyB0aGF0IGhhdmUgY29tZSB1cCB3aXRoCj4gSW50ZWwgQ1BV
cy4KClRoZXJlIGhhcyBiZWVuIHBsZW50eSBvZiBhY2FkZW1pYyByZXNlYXJjaCBkb25lLCBhbmQg
dGhlcmUgYXJlIHJlYWwKdXNlY2FzZXMgd2hlcmUgZGlzYWJsaW5nIEhUIGltcHJvdmVzIHBlcmZv
cm1hbmNlLgoKSG93ZXZlciwgdGhlcmUgYXJlIHBsZW50eSB3aGVuIGl0IGRvZXNuJ3QuwqAgRHVy
aW5nIEwxVEYgdGVzdGluZywKWGVuU2VydmVyIG1lYXN1cmVkIG9uZSB0eXBpY2FsIHVzZWNhc2Ug
KGFncmVnYXRlIHNtYWxsIHBhY2tldCBJTwp0aHJvdWdocHV0LCB3aGljaCBpcyByZXByZXNlbnRh
dGl2ZSBvZiBhIGxvYWQgb2Ygd2Vic2VydmVyIFZNcykgd2hpY2gKdG9vayBhIDYwJSBwZXJmIGhp
dC4KCjEwJSBvZiB0aGlzIHdhcyB0aGUgcmF3IEwxRF9GTFVTSCBoaXQsIHdoaWxlIDUwJSBvZiBp
dCB3YXMgYWN0dWFsbHkgZHVlCnRvIHRoZSBpbmNyZWFzZWQgSU8gbGF0ZW5jeSBvZiBoYWx2aW5n
IHRoZSBudW1iZXIgb2YgdmNwdXMgd2hpY2ggY291bGQKYmUgcnVuIGNvbmN1cnJlbnRseS4KCkFz
IGZvciBjb3JlIGF3YXJlIHNjaGVkdWxpbmcsIGV2ZW4gaWYgbm90aGluZyBlbHNlLCBncm91cGlu
ZyB0aGluZ3MgdXAKd2lsbCBnZXQgeW91IGJldHRlciBjYWNoZSBzaGFyaW5nIGZyb20gdGhlIFZN
J3MgcG9pbnQgb2Ygdmlldy4KCkFzIHlvdSBjYW4gcHJvYmFibHkgdGVsbCwgdGhlIGFuc3dlciBp
cyBmYXIgdG9vIHdvcmtsb2FkIGRlcGVuZGVudCB0bwpjb21lIHVwIHdpdGggYSBnZW5lcmFsIHJ1
bGUsIGJ1dCBhdCBsZWFzdCBoYXZpbmcgdGhlIG9wdGlvbnMgYXZhaWxhYmxlCndpbGwgbGV0IHBl
b3BsZSBleHBlcmltZW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
