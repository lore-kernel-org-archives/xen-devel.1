From: Govinda Tatti <Govinda.Tatti@Oracle.COM>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Fri, 15 Dec 2017 13:52:14 -0600
Message-ID: <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48__11443.8975033865$1513367605$gmane$org@Oracle.COM>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-3-Govinda.Tatti@Oracle.COM>
 <5A2A6AB10200007800195D4F@prv-mh.provo.novell.com>
 <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=onmx=dl=oracle.com=govinda.tatti@srs-us1.protection.inumbo.net>)
 id 1ePw23-0001nS-BY
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 19:52:31 +0000
In-Reply-To: <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SmFuLAoKT25lIHF1aWNrIHVwZGF0ZSBvbiBwY2llX2ZscigpIHNwZWNpZmljIGltcGxlbWVudGF0
aW9uLiBQbGVhc2Ugc2VlIGJlbG93Lgo+Pj4gK3N0YXRpYyBpbnQgcGNpc3R1Yl9kZXZpY2VfcmVz
ZXQoc3RydWN0IHBjaV9kZXYgKmRldikKPj4+ICt7Cj4+PiArCXN0cnVjdCB4ZW5fcGNpYmtfZGV2
X2RhdGEgKmRldl9kYXRhOwo+Pj4gKwlib29sIHNsb3QgPSBmYWxzZSwgYnVzID0gZmFsc2U7Cj4+
PiArCXN0cnVjdCBwY2lzdHViX2FyZ3MgYXJnID0ge307Cj4+PiArCj4+PiArCWlmICghZGV2KQo+
Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiArCWRldl9kYmcoJmRldi0+ZGV2LCAiWyVz
XVxuIiwgX19mdW5jX18pOwo+Pj4gKwo+Pj4gKwkvKiBGaXJzdCBjaGVjayBhbmQgdHJ5IEZMUiAq
Lwo+Pj4gKwlpZiAocGNpZV9oYXNfZmxyKGRldikpIHsKPj4+ICsJCWRldl9kYmcoJmRldi0+ZGV2
LCAicmVzZXR0aW5nICVzIGRldmljZSB1c2luZyBGTFJcbiIsCj4+PiArCQkJcGNpX25hbWUoZGV2
KSk7Cj4+PiArCQlwY2llX2ZscihkZXYpOwo+PiBUaGUgbGFjayBvZiBlcnJvciBjaGVjayBoZXJl
IHB1enpsZWQgbWUsIGJ1dCBJIHNlZSB0aGUgZnVuY3Rpb24KPj4gaW5kZWVkIHJldHVybnMgdm9p
ZCByaWdodCBub3cuIEkgdGhpbmsgdGhlIHByZXJlcSBwYXRjaCBzaG91bGQKPj4gY2hhbmdlIHRo
aXMgYWxvbmcgd2l0aCBleHBvcnRpbmcgdGhlIGZ1bmN0aW9uIC0geW91IHJlYWxseSBkb24ndAo+
PiB3YW50IHRoZSBkZXZpY2UgdG8gYmUgaGFuZGVkIHRvIGEgZ3Vlc3Qgd2hlbiB0aGUgRkxSIHRp
bWVkCj4+IG91dC4KPiBXZSB3aWxsIGNoYW5nZSBwY2llX2ZscigpIHRvIHJldHVybiBlcnJvciBj
b2RlLiBJIHdpbGwgbWFrZSB0aGlzIGNoYW5nZQo+IGluIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhp
cyBwYXRjaC4KSSBleGNoYW5nZWQgc29tZSBlbWFpbHMgd2l0aCBCam9ybi9DaHJpc3RvcGggYW5k
IGl0IGxvb2tzIGxpa2UgQ2hyaXN0b3BoCmFzIHNvbWUgcGxhbnRvIHJlc3RydWN0dXJlIHBjaWUg
ZmxyIHNwZWNpZmljIGZ1bmN0aW9ucyBidXQgSSBkb24ndCBrbm93CnRoZSBleGFjdCB0aW1lLWZy
YW1lLiBGb3Igbm93LEkgYW0gcGxhbm5pbmcgdG8gdXNlIGV4aXN0aW5nIHBjaWVfZmxyKCkKYWZ0
ZXIgY2hlY2tpbmcgRkxSIGNhcGFiaWxpdHkuIFdlIHdpbGwgc3dpdGNodG8gcmV2aXNlZCBwY2ll
X2ZscigpIG9uY2UKaXQgaXMgYXZhaWxhYmxlLgoKSSBob3BlIHlvdSBhcmUgZmluZSB3aXRoIHRo
aXMgYXBwcm9hY2guIFBsZWFzZSBsZXQgbWUga25vdy4gVGhhbmtzLgoKQ2hlZXJzCkdPVklOREEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
