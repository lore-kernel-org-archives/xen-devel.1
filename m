From: Julien Grall <julien.grall@arm.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 14:16:27 +0100
Message-ID: <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLScZ-0000lM-Tr
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:16:31 +0000
In-Reply-To: <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMC8wNC8yMDE5IDEyOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4w
NC4xOSBhdCAxMjo0NCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+IEFuIGFsdGVybmF0aXZl
IHdvdWxkIGJlIG1lbW9yeSBiYXJyaWVycyBiZXR3ZWVuIHRoZSB3cml0ZXMgb24gQVJNLAo+PiBy
aWdodD8gT3IgYSBzdHJvbmcgb3JkZXJlZCBzZXRfYml0KCkgdmFyaWFudCAod2UgaGFkIHRoYXQg
ZGlzY3Vzc2lvbgo+PiByZWNlbnRseSByZWxhdGVkIHRvIGEgYmFycmllciBpbiBBUk0tc3BlY2lm
aWMgX19jcHVfZGlzYWJsZSgpKS4KCkkgYW0gbm90IGVudGlyZWx5IGEgYmlnIGZhbiBvZiBhIHN0
cm9uZy1vcmRlciB2YXJpYW50LiBJdCB3aWxsIHBvdGVudGlhbGx5IGFkZCAKbW9yZSBtZW1vcnkg
YmFycmllcnMgdGhhbiBuZWNlc3NhcnkgaW4gdGhpcyBjb250ZXh0LgoKPiAKPiBZZXMuCgpXaGF0
IHdvdWxkIGJlIHRoZSBhZHZhbnRhZ2Ugb2YgMi0zIG1lbW9yeSBiYXJyaWVycyBvdmVyIGEgbWVt
b3J5IGJhcnJpZXIgKyBjaGVjaz8KCj4gCj4+IFRoZW4gd2UgY291bGQgZHJvcCB0aGlzICNpZm5k
ZWYgc2VjdGlvbi4KPiAKPiBOb3Qgc3VyZSBhYm91dCB0aGlzIC0gSSdtIGFjdHVhbGx5IHVuY29u
dmluY2VkIHRoZSBsYXR0ZXIgcGFydCBvZgo+IHdoYXQncyBpbnNpZGUgdGhlICNpZmRlZiBpc24n
dCBhY3R1YWxseSBuZWVkZWQgb24geDg2IGFzIHdlbGwuIEp1c3QKPiBjb25zaWRlciB0aGUgY2Fz
ZSBvZiB2Y3B1X3VuYmxvY2soKSBtYWtpbmcgaXQgdG8gdGhlIHZjcHVfd2FrZSgpCj4gaW52b2Nh
dGlvbiBvbiBhbm90aGVyIENQVSB3aGlsZSB3ZSdyZSBiZXR3ZWVuIGFueSB0d28gb2YgdGhlCj4g
dGhyZWUgd3JpdGVzIGhlcmUuIChJIGtub3cgSSd2ZSBiZWVuIGZlZWxpbmcgdW5lYXN5IGFib3V0
IHRoaXMKPiBiZWZvcmUsIGJ1dCBJIGd1ZXNzIEkgbXVzdCBoYXZlIGNvbWUgdG8gdGhlIGNvbmNs
dXNpb24gdGhhdCBpdCdzCj4gX3Byb2JhYmx5XyBva2F5LikKVGhhdCdzIG5vdCBnb2luZyB0byBi
ZSBjb3ZlcmVkIGJ5IHRoZSBjaGVjayBvbiBub24teDg2IHBsYXRmb3JtLiBJbmRlZWQsIAp2Y3B1
X3dha2UoKSBpcyBub3QgdXBkYXRpbmcgYW55IG9mIHRoZSBmaWVsZHMuIFNvLCBmcm9tIG15IHVu
ZGVyc3RhbmRpbmcsIHRoZSAKd2FrZS11cCByZXF1ZXN0IHdpbGwganVzdCBiZSBpZ25vcmVkLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
