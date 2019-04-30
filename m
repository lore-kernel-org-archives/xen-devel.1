From: Julien Grall <julien.grall@arm.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 14:35:00 +0100
Message-ID: <0d999744-93b6-aee6-ff04-785dddcadbee@arm.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
 <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
 <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLSuW-0002Zp-V4
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:35:05 +0000
In-Reply-To: <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzMC8wNC8yMDE5IDE0OjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4x
OSBhdCAxNToxNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMzAvMDQvMjAx
OSAxMjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNC4xOSBhdCAxMjo0NCwg
PGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgbWVt
b3J5IGJhcnJpZXJzIGJldHdlZW4gdGhlIHdyaXRlcyBvbiBBUk0sCj4+Pj4gcmlnaHQ/IE9yIGEg
c3Ryb25nIG9yZGVyZWQgc2V0X2JpdCgpIHZhcmlhbnQgKHdlIGhhZCB0aGF0IGRpc2N1c3Npb24K
Pj4+PiByZWNlbnRseSByZWxhdGVkIHRvIGEgYmFycmllciBpbiBBUk0tc3BlY2lmaWMgX19jcHVf
ZGlzYWJsZSgpKS4KPj4KPj4gSSBhbSBub3QgZW50aXJlbHkgYSBiaWcgZmFuIG9mIGEgc3Ryb25n
LW9yZGVyIHZhcmlhbnQuIEl0IHdpbGwgcG90ZW50aWFsbHkgYWRkCj4+IG1vcmUgbWVtb3J5IGJh
cnJpZXJzIHRoYW4gbmVjZXNzYXJ5IGluIHRoaXMgY29udGV4dC4KPj4KPj4+Cj4+PiBZZXMuCj4+
Cj4+IFdoYXQgd291bGQgYmUgdGhlIGFkdmFudGFnZSBvZiAyLTMgbWVtb3J5IGJhcnJpZXJzIG92
ZXIgYSBtZW1vcnkgYmFycmllciArCj4+IGNoZWNrPwo+IAo+IER1bm5vIC0gSSd2ZSBtZXJlbHkg
Y29uZmlybWVkIHRoYXQgdGhpcyBsb29rcyB0byBiZSBhbiBhbHRlcm5hdGl2ZQo+IGNvcnJlY3Qg
c29sdXRpb24uCj4gCj4+Pj4gVGhlbiB3ZSBjb3VsZCBkcm9wIHRoaXMgI2lmbmRlZiBzZWN0aW9u
Lgo+Pj4KPj4+IE5vdCBzdXJlIGFib3V0IHRoaXMgLSBJJ20gYWN0dWFsbHkgdW5jb252aW5jZWQg
dGhlIGxhdHRlciBwYXJ0IG9mCj4+PiB3aGF0J3MgaW5zaWRlIHRoZSAjaWZkZWYgaXNuJ3QgYWN0
dWFsbHkgbmVlZGVkIG9uIHg4NiBhcyB3ZWxsLiBKdXN0Cj4+PiBjb25zaWRlciB0aGUgY2FzZSBv
ZiB2Y3B1X3VuYmxvY2soKSBtYWtpbmcgaXQgdG8gdGhlIHZjcHVfd2FrZSgpCj4+PiBpbnZvY2F0
aW9uIG9uIGFub3RoZXIgQ1BVIHdoaWxlIHdlJ3JlIGJldHdlZW4gYW55IHR3byBvZiB0aGUKPj4+
IHRocmVlIHdyaXRlcyBoZXJlLiAoSSBrbm93IEkndmUgYmVlbiBmZWVsaW5nIHVuZWFzeSBhYm91
dCB0aGlzCj4+PiBiZWZvcmUsIGJ1dCBJIGd1ZXNzIEkgbXVzdCBoYXZlIGNvbWUgdG8gdGhlIGNv
bmNsdXNpb24gdGhhdCBpdCdzCj4+PiBfcHJvYmFibHlfIG9rYXkuKQo+PiBUaGF0J3Mgbm90IGdv
aW5nIHRvIGJlIGNvdmVyZWQgYnkgdGhlIGNoZWNrIG9uIG5vbi14ODYgcGxhdGZvcm0uIEluZGVl
ZCwKPj4gdmNwdV93YWtlKCkgaXMgbm90IHVwZGF0aW5nIGFueSBvZiB0aGUgZmllbGRzLiBTbywg
ZnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUKPj4gd2FrZS11cCByZXF1ZXN0IHdpbGwganVzdCBi
ZSBpZ25vcmVkLgo+IAo+IFBlcmhhcHMgYSBtaXN1bmRlcnN0YW5kaW5nIChvciBJJ20gY29uZnVz
ZWQgbm93KTogSSBtZW50aW9uZWQKPiB2Y3B1X3dha2UoKSBvbmx5IHRvIGRlbGltaXQgaG93IG11
Y2ggb2YgdmNwdV91bmJsb2NrKCkgbmVlZHMKPiBjb21wbGV0aW5nIGZvciB0aGUgcG9zc2libGUg
cHJvYmxlbSB0byBzdXJmYWNlIHRoYXQgSSdtIHN1c3BlY3RpbmcuCgpJIGFtIG5vdCBzdXJlIHdo
YXQgcHJvYmxlbSB5b3UgcmVmZXIuIElzIGl0IHRoZSB3YWtlLXVwIHJlcXVlc3Qgd2lsbCBnZXQg
aWdub3JlZD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
