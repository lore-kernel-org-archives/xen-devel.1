From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] VT-d/DMAR: accept DRHD with
 non-discoverable PCI devices
Date: Thu, 21 Mar 2019 14:50:30 +0100
Message-ID: <986dc78a-be31-bd3f-81ab-0341b2935396@suse.com>
References: <1553113323-14664-1-git-send-email-igor.druzhinin@citrix.com>
 <574cb5d6-fb95-d8e9-c281-2ed24a2f22a5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=owaa=RY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h6y5e-00010Z-NE
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 13:50:38 +0000
In-Reply-To: <574cb5d6-fb95-d8e9-c281-2ed24a2f22a5@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDMvMjAxOSAxNDoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMy8yMDE5
IDIwOjIyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gU2luY2UgY29tbWl0IGRjZjQxNzkwICgi
eDg2L21tY2ZnL2RyaGQ6IE1vdmUgYWNwaV9tbWNmZ19pbml0KCkgY2FsbAo+PiBiZWZvcmUgY2Fs
bGluZyBhY3BpX3BhcnNlX2RtYXIoKSIpIFBDSSBzZWdtZW50IDAgaXMgbm93IGtub3duIGVhcmx5
Cj4+IHdoaWNoIG1hZGUgdGhlIHNhbml0eSBjaGVjayBvbiBEUkhEIGRlZmluaXRpb24gc3RydWN0
dXJlIHRvIHdvcmsuCj4+IFRoaXMsIGluIHR1cm4sIGNhdXNlZCBhIHJlZ3Jlc3Npb24gb24gc29t
ZSBtYWNoaW5lcyAoaW4gcGFydGljdWxhciwKPj4gSFAgUG93ZXJFZGdlIFI3NDAgd2l0aCBJL08g
QVQgRE1BIGRpc2FibGVkKSB3aGVyZSBJT01NVSB3YXMgZXhwbGljaXRseQo+PiBkaXNhYmxlZCBk
dWUgdG8gc29tZSBpbnRlcm5hbCBQQ0kgZGV2aWNlcyBiZWluZyBub24tZGlzY292ZXJhYmxlIGJ1
dAo+PiBwcmVzZW50IGluIERNQVIuCj4+Cj4+IFdoaWxlIHRoaXMgaXMgaW5kZWVkIGEgQklPUyBt
aXN0YWtlIGl0IHNlZW1zIHRvIGJlIG5vdCB0aGF0IGNyaXRpY2FsCj4+IHRvIGRpc2FibGUgdGhl
IHdob2xlIElPTU1VLiBJbnN0ZWFkLCBleHRlbmQgdGhlIHNjb3BlIG9mCj4+ICJ3b3JrYXJvdW5k
X2Jpb3NfYnVnIiBvcHRpb24gYW5kIG1ha2UgaXQgZW5hYmxlZCBieSBkZWZhdWx0LiBUaGlzIGlz
Cj4+IGNvbnNpc3RlbnQgd2l0aCBvdXIgZG9jdW1lbnRhdGlvbiBhbmQgYWN0dWFsbHkgd2hhdCBh
IHVzZXIgbWlnaHQgZXhwZWN0Cj4+IGZyb20gYW4gb3B0aW9uIHdpdGggdGhhdCBuYW1lLiBJdCBh
bHNvIGRvZXNuJ3Qgc2VlbSBzYWZlIHRvIHNpbXBseSBpZ25vcmUKPj4gRFJIRCB3aXRob3V0IGlu
aXRpYWxpemF0aW9uIHNvIHJlbW92ZSB0aGlzIGNhc2UuIEJ1dCBsZWF2ZSB0aGUgb3JpZ2luYWwK
Pj4gRE1BUiBjaGVjayBpbiBwbGFjZSB0byBzdGlsbCBhbGxvdyBlcnJvciByZXBvcnRpbmcuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXgu
Y29tPgo+IAo+IFRoaXMgaXMgY29kZSB3aGljaCB3YXMgcHJldmlvdXNseSBkZWFkLsKgIFRoZSBi
ZWhhdmlvdXIgb2YgaWdub3JpbmcgYW4KPiBJT01NVSBiZWNhdXNlIHRoZXJlIGlzIHVucmVhY2hh
YmxlIGRldmljZSBiZWhpbmQgaXQgaXMgYXdmdWwgYW5kCj4gc2hvdWxkbid0IGV4aXN0LCBidXQg
d2Ugc2hvdWxkIGF0IGxlYXN0IGxlYXZlIGEgdHJhY2Ugb2YgaXQgaW4gdGhlIGxvZ3MuCj4gCj4g
VEJILCBJJ2QgcHJlZmVyIHRvIGRlbGV0ZSB0aGUgYHdvcmthcm91bmRfYmlvc19idWdgIG9wdGlv
biBlbnRpcmVseSwgYW5kCj4ganVzdCBwcmludCBvdXQgdGhlIGJhZCBlbnRyaWVzLsKgIE5vdGhp
bmcgdGhlIG9wdGlvbiBkb2VzIGlzIHdvcnRoeSBvZgo+IHNodXR0aW5nIHRoZSBJT01NVSBkb3du
Lgo+IAo+IENDLWluZyBKdWVyZ2VuIGFzIHRoaXMgaXMgYSA0LjEyIHJlZ3Jlc3Npb24uCj4gCj4g
SSBjYW4gZWFzaWx5IHNwaW4gYSBwYXRjaCBhbG9uZyBteSBzdWdnZXN0ZWQgcm91dGUgaWYgb3Ro
ZXJzIGFncmVlLgoKSmFuIGhhcyBzb21lIGRheXMgb2ZmLCBBRkFJSyBoZSBpcyBnb2luZyB0byBi
ZSBiYWNrIG5leHQgTW9uZGF5LgoKSSdkIGFwcHJlY2lhdGUgYSByYXRoZXIgZmFzdCBhZ3JlZW1l
bnQgZm9yIDQuMTIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
