From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Fri, 25 Jan 2019 03:14:05 -0700
Message-ID: <5C4AE16D0200007800211142@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
 <c279c2fa-564a-7177-d305-38c907d485c3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmyV0-0006uh-EI
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 10:14:10 +0000
In-Reply-To: <c279c2fa-564a-7177-d305-38c907d485c3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, nmanthey@amazon.de, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE5IGF0IDIyOjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV29yc2UgaXMgdGhlICJldmFsdWF0ZSBjb25kaXRpb24sIHN0YXNoIHJlc3VsdCwgZmVu
Y2UsIHVzZSB2YXJpYWJsZSIKPiBvcHRpb24sIHdoaWNoIGlzIGFsbW9zdCBjb21wbGV0ZWx5IHVz
ZWxlc3MuICBJZiB5b3Ugd29yayBvdXQgdGhlCj4gcmVzdWx0aW5nIGluc3RydWN0aW9uIHN0cmVh
bSwgeW91J2xsIGhhdmUgYSBjb25kaXRpb25hbCBleHByZXNzaW9uCj4gY2FsY3VsYXRlZCBkb3du
IGludG8gYSByZWdpc3RlciwgdGhlbiBhIGZlbmNlLCB0aGVuIGEgdGVzdCByZWdpc3RlciBhbmQK
PiBjb25kaXRpb25hbCBqdW1wIGludG8gb25lIG9mIHR3byBiYXNpYyBibG9ja3MuICBUaGlzIHRh
a2VzIHRoZSBwZXJmIGhpdCwKPiBhbmQgZG9lc24ndCBwcm90ZWN0IGVpdGhlciBvZiB0aGUgYmFz
aWMgYmxvY2tzIGZvciBzcGVjdWxhdGl2ZQo+IG1pcy1leGVjdXRpb24uCgpIb3cgZG9lcyBpdCBu
b3QgcHJvdGVjdCBhbnl0aGluZz8gSXQgc2hyaW5rcyB0aGUgc3BlY3VsYXRpb24gd2luZG93CnRv
IGp1c3QgdGhlIHJlZ2lzdGVyIHRlc3QgYW5kIGNvbmRpdGlvbmFsIGJyYW5jaCwgd2hpY2ggb3Vn
aHQgdG8gYmUKZmFyIHNtYWxsZXIgdGhhbiB0aGF0IGJlaGluZCBhIG1lbW9yeSBhY2Nlc3Mgd2hp
Y2ggZmFpbHMgdG8gaGl0IGFueQpvZiB0aGUgY2FjaGVzIChhbmQgcGVyaGFwcyBldmVuIGFueSBv
ZiB0aGUgVExCcykuIFRoaXMgaXMgdGhlIG1vcmUKdGhhdCBMRkVOQ0UgZG9lcyBzcGVjaWZpY2Fs
bHkgbm90IHByZXZlbnQgaW5zbiBmZXRjaGluZyBmcm9tCmNvbnRpbnVpbmcuCgpUaGF0IHNhaWQg
SSBhZ3JlZSB0aGF0IHRoZSBMRkVOQ0Ugd291bGQgYmV0dGVyIHNpdCBiZXR3ZWVuIHRoZQpyZWdp
c3RlciB0ZXN0IGFuZCB0aGUgY29uZGl0aW9uYWwgYnJhbmNoLCBidXQgYXMgd2UndmUgc2FpZCBz
byBtYW55CnRpbWVzIGJlZm9yZSAtIHRoaXMgY2FuJ3QgYmUgYWNoaWV2ZWQgd2l0aG91dCBjb21w
aWxlciBzdXBwb3J0LiBJdCdzCnNhaWQgZW5vdWdoIHRoYXQgdGhlIGRlZmF1bHQgImNjIiBjbG9i
YmVyIG9mIGFzbSgpLXMgb24geDg2IGFsb25lCnByZXZlbnRzIHRoaXMgZnJvbSBwb3NzaWJseSB3
b3JraW5nLCB3aGlsZSBteSBvdmVyIGZvdXIgeWVhciBvbGQKcGF0Y2ggdG8gYWRkIGEgbWVhbnMg
dG8gYXZvaWQgdGhpcyBoYXMgbm90IHNlZW4gc3VmZmljaWVudApjb21tZW50cyB0byBnZXQgaXQg
aW50byBzb21lIGhvcGVmdWxseSBhY2NlcHRhYmxlIHNoYXBlLCBidXQgYWxzbwpoYXMgbm90IGJl
ZW4gYXBwcm92ZWQgYXMgaXMuCgpUaGVuIGFnYWluLCBmb2xsb3dpbmcgYW4gZWFybGllciByZXBs
eSBvZiBtaW5lIG9uIGFub3RoZXIgc3ViLQp0aHJlYWQsIG5vdGhpbmcgcmVhbGx5IHByZXZlbnRz
IHRoZSBjb21waWxlciBmcm9tIG1vdmluZyBhaGVhZAphbmQgZm9sZGluZyB0aGUgdHdvIExGRU5D
RXMgb2YgdGhlICJib3RoIGJyYW5jaGVzIiBtb2RlbCBpbnRvCm9uZS4gSXQganVzdCBzbyBoYXBw
ZW5zIHRoYXQgYXBwYXJlbnRseSByaWdodCBub3cgdGhpcyBuZXZlcgpvY2N1cnMgKGFzc3VtaW5n
IE5vcmJlcnQgaGFzIGRvbmUgZnVsbCBnZW5lcmF0ZWQgY29kZSBhbmFseXNpcwp0byBjb25maXJt
IHRoZSBpbnRlbmRlZCBwbGFjZW1lbnQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
