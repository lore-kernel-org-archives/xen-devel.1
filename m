From: Julien Grall <julien.grall@arm.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Sun, 11 Mar 2018 19:29:26 +0000
Message-ID: <fb92072f-2709-fa5a-0284-08a66c401049@arm.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
 <5A998F0502000078001AE011@suse.com>
 <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
 <dc80422f-80bb-bd37-ed41-bb6559f4d7d8@citrix.com>
 <28f57e5f-7166-efae-0aaf-82edd96194fb@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yupc=gb=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ev6ey-0006I1-9r
 for xen-devel@lists.xenproject.org; Sun, 11 Mar 2018 19:29:32 +0000
In-Reply-To: <28f57e5f-7166-efae-0aaf-82edd96194fb@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKCk9uIDAzLzAyLzIwMTggMDU6MjUgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4gT24gMDIvMDMvMTggMTg6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDAyLzAzLzE4
IDE3OjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDIvMDMvMTggMTc6NTEsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDE3OjI1LCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAwMi8wMy8xOCAxNjoxOCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+Pj4+PiBPbiAwMi4wMy4xOCBhdCAxNzowNCwgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOgo+Pj4+Pj4+IFRoZSBwcm9wZXIgd2F5IHRvIGRvIHRoaXMgaXMgaW5kZWVk
IGJ5IGEgbm9taW5hdGVkIChndWVzdCkgcGh5c2ljYWwKPj4+Pj4+PiBhZGRyZXNzLCBhdCB3aGlj
aCBwb2ludCBYZW4gY2FuIG1ha2UgYWxsL2FueSB1cGRhdGVzIGF0IHRpbWVzIG9mIGl0cwo+Pj4+
Pj4+IGNob29zaW5nLCBhbmQgdGhlIGd1ZXN0cyBwYWdldGFibGUvcGVybWlzc2lvbnMgc3RhdGUg
YXQgYW4gaW5zdGFudGFuZW91cwo+Pj4+Pj4+IG1vbWVudCBkb24ndCBtYXR0ZXIuCj4+Pj4+Pj4K
Pj4+Pj4+PiBJZiB5b3UndmUgZ290IHRpbWUgdG8gZG8gdGhpcywgdGhlbiBwbGVhc2UgZG8uICBJ
dCB3aWxsIGJlIGEgZGVmaW5pdGUKPj4+Pj4+PiBpbXByb3ZlbWVudC4KPj4+Pj4+IEp1c3QgdG8g
YmUgYXZvaWQgdW5uZWNlc3NhcnkgZWZmb3J0IGluIHRoZSB3cm9uZyBkaXJlY3Rpb246IEkgZG9u
J3QKPj4+Pj4+IHRoaW5rIHlvdSBjYW4gYWx0ZXIgdGhlIGN1cnJlbnQgaW50ZXJmYWNlLiBZb3Un
ZCBoYXZlIHRvIGFkZCBhIG5ldwo+Pj4+Pj4gb25lLCBhbmQgd2UgY291bGQgdGhlbiBkZXByZWNh
dGUgKGJ1dCBuZXZlciBhYmFuZG9uKSB0aGUgY3VycmVudAo+Pj4+Pj4gb25lLgo+Pj4+PiBJIHdh
cyBvbmx5IHBsYW5uaW5nIHRvIHN0b3JlIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHJhdGhl
ciB0aGFuIHRoZQo+Pj4+PiB2aXJ0dWFsIGFkZHJlc3MgYXMgd2UgZG8gdG9kYXkuIElzIHRoYXQg
Y29uc2lkZXJlZCBhcyBhbiBhbHRlcmF0aW9uIG9mCj4+Pj4+IHRoZSBjdXJyZW50IGludGVyZmFj
ZT8KPj4+PiBZZXMsIGl0IGlzLCBhcyBhbiBleGlzdGluZyBQViBrZXJuZWwgY291bGQgZGVsaWJl
cmF0ZWx5IGFsdGVyIHRoZQo+Pj4+IG1hcHBpbmdzIHVuZGVybHlpbmcgdGhlIGxpbmVhciBhZGRy
ZXNzIGl0IGhhcyBoYW5kZWQgdXMuCj4+PiBMaW51eCBwdm9wcyBrZXJuZWwgaXNuJ3QgZG9pbmcg
dGhpcy4gTWluaS1PUyBuZWl0aGVyLiBJIGd1ZXNzIGtlcm5lbC14ZW4KPj4+IHdvdWxkIGJlIG9r
YXkgd2l0aCB0aGlzLCB0b28uIEFuZCBJIGJldCBCU0QgaXMgYWxzbyBmaW5lLgo+Pj4KPj4+IFNl
cmlvdXNseTogYW55IGtlcm5lbCBwbGF5aW5nIHN1Y2ggdHJpY2tzIGlzIGFza2luZyBmb3IgcHJv
YmxlbXMuCj4+Pgo+Pj4gV2Ugc2hvdWxkbid0IHN1cHBvcnQgb3BlcmF0aW9uIG1vZGVzIHdoaWNo
IG1ha2Ugbm8gc2Vuc2UganVzdCBmb3IgdGhlCj4+PiBzYWtlIG9mIGNvbXBhdGliaWxpdHksIElN
Ty4KPj4KPj4gSSdkIGxvdmUgdG8gZG8gdGhpcywgYnV0IHdlIGNhbnQuwqAgT2xkZXIgTGludXgg
dXNlZCB0byBoYXZlIGEgdmlydHVhbAo+PiBidWZmZXIgc3Bhbm5pbmcgYSBwYWdlIGJvdW5kYXJ5
LsKgIENoYW5naW5nIHRoZSBiZWhhdmlvdXIgdW5kZXIgdGhhdCB3aWxsCj4+IGNhdXNlIG9sZGVy
IHNldHVwcyB0byBleHBsb2RlLgo+IAo+IEFkZGluZyBhIHNwZWNpYWwgcGVyLWRvbWFpbiBtYXBw
aW5nIGZvciB0aGF0IHB1cnBvc2Ugd291bGQgd29yay4KCkkgYW0gbm90IHN1cmUgdG8gdW5kZXJz
dGFuZCB5b3VyIHN1Z2dlc3Rpb24gaGVyZS4gV291bGQgeW91IG1pbmQgZ2l2aW5nIAphIGJpdCBt
b3JlIGRldGFpbHM/CgpJZiB0aGUgYnVmZmVyIGlzIHNwYW5uaW5nIGEgcGFnZSBib3VuZGFyeSAo
aXQgc2VlbXMgdG8gYmUgdGhlIGNhc2Ugb24gCmN1cnJlbnQgTGludXgpLCB5b3Ugd291bGQgbmVl
ZCB0byBtYXAgMiBwYWdlcyB1c2luZyB2bWFwIGluIFhlbiAKcGVyLVZDUFUuIFdvdWxkIHRoYXQg
YmUgYWNjZXB0YWJsZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
