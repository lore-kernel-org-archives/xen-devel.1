From: Juergen Gross <jgross@suse.com>
Subject: Re: Ping: [PATCH] xen/sched: fix csched2_deinit_pdata()
Date: Fri, 17 May 2019 15:43:22 +0200
Message-ID: <ca52e3bf-2e9a-1b1e-f079-be72bc4a242d@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
 <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
 <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
 <5CDEB8C102000078002301DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRd8w-0005Q0-KM
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 13:43:26 +0000
In-Reply-To: <5CDEB8C102000078002301DE@prv1-mh.provo.novell.com>
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

T24gMTcvMDUvMjAxOSAxNTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDUuMTkg
YXQgMTU6MjQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxNy8wNS8yMDE5IDE1OjE3
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjA1LjE5IGF0IDEzOjMxLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBDb21taXQgNzUzYmE0M2Q2ZDE2ZTY4OCAoInhlbi9zY2hl
ZDogZml4IGNyZWRpdDIgc210IGlkbGUgaGFuZGxpbmciKQo+Pj4+IGludHJvZHVjZWQgYSByZWdy
ZXNzaW9uIHdoZW4gc3dpdGNoaW5nIGNwdXMgYmV0d2VlbiBjcHVwb29scy4KPj4+Pgo+Pj4+IFdo
ZW4gYXNzaWduaW5nIGEgY3B1IHRvIGEgY3B1cG9vbCB3aXRoIGNyZWRpdDIgYmVpbmcgdGhlIGRl
ZmF1bHQKPj4+PiBzY2hlZHVsZXIgY3NjaGVkMl9kZWluaXRfcGRhdGEoKSBpcyBjYWxsZWQgZm9y
IHRoZSBjcmVkaXQyIHByaXZhdGUgZGF0YQo+Pj4+IGFmdGVyIHRoZSBuZXcgc2NoZWR1bGVyJ3Mg
cHJpdmF0ZSBkYXRhIGhhcyBiZWVuIGhvb2tlZCB0byB0aGUgcGVyLWNwdQo+Pj4+IHNjaGVkdWxl
ciBkYXRhLiBVbmZvcnR1bmF0ZWx5IGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgd2lsbCBjeWNsZSB0
aHJvdWdoCj4+Pj4gYWxsIHBlci1jcHUgc2NoZWR1bGVyIGFyZWFzIGl0IGtub3dzIG9mIGZvciBy
ZW1vdmluZyB0aGUgY3B1IGZyb20gdGhlCj4+Pj4gcmVzcGVjdGl2ZSBzaWJsaW5nIG1hc2tzIGlu
Y2x1ZGluZyB0aGUgYXJlYSBvZiB0aGUganVzdCBtb3ZlZCBjcHUuIFRoaXMKPj4+PiB3aWxsIChk
ZXBlbmRpbmcgb24gdGhlIG5ldyBzY2hlZHVsZXIpIGVpdGhlciBjbG9iYmVyIHRoZSBkYXRhIG9m
IHRoZQo+Pj4+IG5ldyBzY2hlZHVsZXIgb3IgaW4gY2FzZSBvZiBzY2hlZF9ydCBsZWFkIHRvIGEg
Y3Jhc2guCj4+Pj4KPj4+PiBBdm9pZCB0aGF0IGJ5IHJlbW92aW5nIHRoZSBjcHUgZnJvbSB0aGUg
bGlzdCBvZiBhY3RpdmUgY3B1cyBpbiBjcmVkaXQyCj4+Pj4gZGF0YSBmaXJzdC4KPj4+Pgo+Pj4+
IFRoZSBvcHBvc2l0ZSBwcm9ibGVtIGlzIG9jY3VycmluZyB3aGVuIHJlbW92aW5nIGEgY3B1IGZy
b20gYSBjcHVwb29sOgo+Pj4+IGluaXRfcGRhdGEoKSBvZiBjcmVkaXQyIHdpbGwgYWNjZXNzIHRo
ZSBwZXItY3B1IGRhdGEgb2YgdGhlIG9sZAo+Pj4+IHNjaGVkdWxlci4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Cj4+PiBNYXkgSSBh
c2sgd2hhdCB0aGUgZGlzcG9zaXRpb24gb2YgdGhpcyBpcz8gSSd2ZSBub3RpY2VkIHRvbyBsYXRl
Cj4+PiB0aGF0IEkndmUgYmFja3BvcnRlZCB0aGUgY29tbWl0IGJlaW5nIGZpeGVkIGhlcmUgd2l0
aG91dAo+Pj4gd2FpdGluZyBmb3IgdGhpcyBmaXggdG8gZ28gaW4uIEknZCBwcmVmZXIgdGhlIHN0
YWJsZSB0cmVlcywgaW4KPj4+IHBhcnRpY3VsYXIgNC4xMSBmb3IgdGhlIGltcGVuZGluZyA0LjEx
LjIgcmVsZWFzZSwgdG8gYmUgYWJsZQo+Pj4gdG8gcGljayB0aGlzIHVwIHNvb24uCj4+Cj4+IERh
cmlvIGFscmVhZHkgZ2F2ZSBoaXMgUmV2aWV3ZWQtYnk6Cj4gCj4gT2gsIG15IGZhdWx0IHRoZW4g
LSBhcG9sb2dpZXMuCgpOUC4gSW4gY2FzZSB5b3UgbmVlZCB0aGUgcG9pbnRlcjoKCmh0dHBzOi8v
bGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAwNzM0Lmh0
bWwKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
