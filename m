From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2 2/2] x86/altp2m: Fixed domain crash with
 INVALID_ALTP2M EPTP index
Date: Mon, 25 Jun 2018 07:11:21 -0600
Message-ID: <5B30E9F902000078001CD899@prv1-mh.provo.novell.com>
References: <1528879939-11570-1-git-send-email-rcojocaru@bitdefender.com>
 <1528879939-11570-2-git-send-email-rcojocaru@bitdefender.com>
 <5B2D159E02000078001CD06C@prv1-mh.provo.novell.com>
 <d129249b-247d-d450-3af1-33c824daae8d@bitdefender.com>
 <8da03feb-53f0-e566-09cc-b311575ac019@bitdefender.com>
 <5B30DFFE02000078001CD81E@prv1-mh.provo.novell.com>
 <c3101989-4c4e-036d-9169-29e28045b7a3@bitdefender.com>
 <105579cf-9018-f211-c869-ca98e0c84c32@bitdefender.com>
 <5B30E5EA02000078001CD86D@prv1-mh.provo.novell.com>
 <a5f6d53e-8b11-2099-a7f2-65342df582c2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a5f6d53e-8b11-2099-a7f2-65342df582c2@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDE0OjU5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gUXVpdGUgcmlnaHQsIHRoYXQncyBleGFjdGx5IHdoYXQgSSd2ZSBiZWVuIGRvaW5nOiBh
IHNhdGlzZmFjdG9yeSBmaXgKPiBhcHBlYXJzIHRvIGJlIHRvIHNpbXBseSByZXZlcnNlIHRoZSBv
cmRlciBvZiBhbHRwMm1fdmNwdV91cGRhdGVfcDJtKHYpCj4gYW5kIGFsdHAybV92Y3B1X3VwZGF0
ZV92bWZ1bmNfdmUodikgaW4gYWx0cDJtX3ZjcHVfZGVzdHJveSgpLgoKQW5kIHRoYXQncyBhbHNv
IG1vcmUgbG9naWNhbCBjb25zaWRlcmluZyB0aGF0CnZteF92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUo
KSBtb2RpZmllcwpTRUNPTkRBUllfRVhFQ19FTkFCTEVfVklSVF9FWENFUFRJT05TIHdoaWNoCnZt
eF92Y3B1X3VwZGF0ZV9lcHRwKCkgYWN0dWFsbHkgbG9va3MgYXQgdG8gZGVjaWRlIHdoZXRoZXIg
dG8Kd3JpdGUgRVBUUF9JTkRFWC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
