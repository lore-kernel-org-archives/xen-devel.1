From: Juergen Gross <jgross@suse.com>
Subject: Re: Ping: [PATCH] xen/sched: fix csched2_deinit_pdata()
Date: Fri, 17 May 2019 15:24:14 +0200
Message-ID: <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
 <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRcqT-0003jC-8s
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 13:24:21 +0000
In-Reply-To: <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMjAxOSAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDUuMTkg
YXQgMTM6MzEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBDb21taXQgNzUzYmE0M2Q2ZDE2
ZTY4OCAoInhlbi9zY2hlZDogZml4IGNyZWRpdDIgc210IGlkbGUgaGFuZGxpbmciKQo+PiBpbnRy
b2R1Y2VkIGEgcmVncmVzc2lvbiB3aGVuIHN3aXRjaGluZyBjcHVzIGJldHdlZW4gY3B1cG9vbHMu
Cj4+Cj4+IFdoZW4gYXNzaWduaW5nIGEgY3B1IHRvIGEgY3B1cG9vbCB3aXRoIGNyZWRpdDIgYmVp
bmcgdGhlIGRlZmF1bHQKPj4gc2NoZWR1bGVyIGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgaXMgY2Fs
bGVkIGZvciB0aGUgY3JlZGl0MiBwcml2YXRlIGRhdGEKPj4gYWZ0ZXIgdGhlIG5ldyBzY2hlZHVs
ZXIncyBwcml2YXRlIGRhdGEgaGFzIGJlZW4gaG9va2VkIHRvIHRoZSBwZXItY3B1Cj4+IHNjaGVk
dWxlciBkYXRhLiBVbmZvcnR1bmF0ZWx5IGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgd2lsbCBjeWNs
ZSB0aHJvdWdoCj4+IGFsbCBwZXItY3B1IHNjaGVkdWxlciBhcmVhcyBpdCBrbm93cyBvZiBmb3Ig
cmVtb3ZpbmcgdGhlIGNwdSBmcm9tIHRoZQo+PiByZXNwZWN0aXZlIHNpYmxpbmcgbWFza3MgaW5j
bHVkaW5nIHRoZSBhcmVhIG9mIHRoZSBqdXN0IG1vdmVkIGNwdS4gVGhpcwo+PiB3aWxsIChkZXBl
bmRpbmcgb24gdGhlIG5ldyBzY2hlZHVsZXIpIGVpdGhlciBjbG9iYmVyIHRoZSBkYXRhIG9mIHRo
ZQo+PiBuZXcgc2NoZWR1bGVyIG9yIGluIGNhc2Ugb2Ygc2NoZWRfcnQgbGVhZCB0byBhIGNyYXNo
Lgo+Pgo+PiBBdm9pZCB0aGF0IGJ5IHJlbW92aW5nIHRoZSBjcHUgZnJvbSB0aGUgbGlzdCBvZiBh
Y3RpdmUgY3B1cyBpbiBjcmVkaXQyCj4+IGRhdGEgZmlyc3QuCj4+Cj4+IFRoZSBvcHBvc2l0ZSBw
cm9ibGVtIGlzIG9jY3VycmluZyB3aGVuIHJlbW92aW5nIGEgY3B1IGZyb20gYSBjcHVwb29sOgo+
PiBpbml0X3BkYXRhKCkgb2YgY3JlZGl0MiB3aWxsIGFjY2VzcyB0aGUgcGVyLWNwdSBkYXRhIG9m
IHRoZSBvbGQKPj4gc2NoZWR1bGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gTWF5IEkgYXNrIHdoYXQgdGhlIGRpc3Bvc2l0aW9uIG9m
IHRoaXMgaXM/IEkndmUgbm90aWNlZCB0b28gbGF0ZQo+IHRoYXQgSSd2ZSBiYWNrcG9ydGVkIHRo
ZSBjb21taXQgYmVpbmcgZml4ZWQgaGVyZSB3aXRob3V0Cj4gd2FpdGluZyBmb3IgdGhpcyBmaXgg
dG8gZ28gaW4uIEknZCBwcmVmZXIgdGhlIHN0YWJsZSB0cmVlcywgaW4KPiBwYXJ0aWN1bGFyIDQu
MTEgZm9yIHRoZSBpbXBlbmRpbmcgNC4xMS4yIHJlbGVhc2UsIHRvIGJlIGFibGUKPiB0byBwaWNr
IHRoaXMgdXAgc29vbi4KCkRhcmlvIGFscmVhZHkgZ2F2ZSBoaXMgUmV2aWV3ZWQtYnk6CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
