From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [xen-4.11-testing test] 136385: regressions - FAIL
Date: Mon, 20 May 2019 11:30:08 +0100
Message-ID: <23778.33200.47146.497482@mariner.uk.xensource.com>
References: <osstest-136385-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSfZ5-0001dg-Qq
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:30:43 +0000
In-Reply-To: <osstest-136385-mainreport@xen.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEz
NjM4NTogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gZmxpZ2h0IDEzNjM4NSB4ZW4tNC4xMS10ZXN0
aW5nIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzEzNjM4NS8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2gg
Y291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1kZWJpYW5odm0t
YW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEzNTY4Mwo+ICB0ZXN0
LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRlYmlhbmh2bS1pMzg2LXhzbSAxMCBkZWJpYW4taHZtLWlu
c3RhbGwgZmFpbCBSRUdSLiB2cy4gMTM1NjgzCgpUaGVzZSBhcmUgYSBrbm93biBidWcuICBUaGUg
RGViaWFuICJzdHJldGNoIiAoInN0YWJsZSIpIGkzODYga2VybmVsCnNpbXBseSBkb2VzIG5vdCB3
b3JrIHVuZGVyIFhlbiBIVk0uICBJIGRvbid0IHRobmsgdGhpcyBpcyBhbnl0aGluZyB0bwpkbyB3
aXRoIHRoZSA0LjExIFhlbiBjb21taXRzIHVuZGVyIHRlc3QgaGVyZS4gIEl0IGlzIGFwcGVhcmlu
ZyBoZXJlIGluCnRoaXMgZmxpZ2h0IGJlY2F1c2UgSSByZW9yZ2FuaXNlZCB0aGUgYW1kNjQvaTM4
NiB0ZXN0IGpvYnMuCgo+ICB0ZXN0LWFybWhmLWFybWhmLXhsLWNyZWRpdDIgMTYgZ3Vlc3Qtc3Rh
cnQvZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMzU2ODMKCkkgbG9va2VkIGF0IHRoaXMu
ICBJIHRob3VnaHQgaXQgbWlnaHQgYmUgdGhlIGtub3duIHhlbnN0b3JlIG1lbW9yeQpoYW5kbGlu
ZyBidWcgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBiZS4gIEkgbG9va2VkIGF0IHRoZSBsb2dzIGFu
ZCB0aGUKZ3Vlc3Qgc2VlbXMgc2ltcGx5IG5vdCB0byBoYXZlIHN0YXJ0ZWQgYXQgYWxsLiAgVGhl
cmUgaXMgbm90aGluZyBmcm9tCml0IGluIGl0cyBwdiBjb25zb2xlLiAgQWRkaW5nIHNvbWUgQVJN
IGZvbGtzLiAgSSBoYXZlIGEgbWVtb3J5IG9mIHNvbWUKYWxsZWdhdGlvbiB0aGF0IHRoZXJlIGlz
IGEgZnVuZGFtZW50YWwgY2FjaGUgbWlzbWFuYWdlbWVudCBwcm9ibGVtCndoaWNoIG1pZ2h0IGNh
dXNlIHRoaXMsIGluIHdoaWNoIGNhc2Ugd2UgcHJvYmFibHkgb3VnaHQgdG8gZm9yY2UgcHVzaC4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
