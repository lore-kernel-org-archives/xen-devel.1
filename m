From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] x86/svm: add EFER SVME support for
 VGIF/VLOAD
Date: Tue, 13 Feb 2018 02:31:33 -0700
Message-ID: <5A82BE8502000078001A73AE@prv-mh.provo.novell.com>
References: <20180207210624.119059-1-brian.woods@amd.com>
 <20180208170147.89927-1-brian.woods@amd.com>
 <5A7B6A7C0200003403432E6E@prv-mh.provo.novell.com>
 <5A7C82880200003F043E54B7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A7C82880200003F043E54B7@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE4IGF0IDE4OjAxLCA8YnJpYW4ud29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYwo+IEBAIC02MTEsNiArNjExLDEyIEBAIHN0YXRpYyB2b2lkIHN2bV91cGRhdGVf
Z3Vlc3RfZWZlcihzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIGlmICggbG1hICkKPiAgICAgICAgICBu
ZXdfZWZlciB8PSBFRkVSX0xNRTsKPiAgICAgIHZtY2Jfc2V0X2VmZXIodm1jYiwgbmV3X2VmZXIp
Owo+ICsKPiArICAgIGlmICggIW5lc3RlZGh2bV9lbmFibGVkKHYtPmRvbWFpbikgKQo+ICsgICAg
ICAgIEFTU0VSVCghKHYtPmFyY2guaHZtX3ZjcHUuZ3Vlc3RfZWZlciAmIEVGRVJfU1ZNRSkpOwo+
ICsKPiArICAgIGlmICggbmVzdGVkaHZtX2VuYWJsZWQodi0+ZG9tYWluKSApCj4gKyAgICAgICAg
c3ZtX25lc3RlZF9mZWF0dXJlc19vbl9lZmVyX3VwZGF0ZSh2KTsKPiAgfQoKV2h5IG5vdAoKICAg
IGlmICggbmVzdGVkaHZtX2VuYWJsZWQodi0+ZG9tYWluKSApCiAgICAgICAgc3ZtX25lc3RlZF9m
ZWF0dXJlc19vbl9lZmVyX3VwZGF0ZSh2KTsKICAgIGVsc2UKICAgICAgICBBU1NFUlQoISh2LT5h
cmNoLmh2bV92Y3B1Lmd1ZXN0X2VmZXIgJiBFRkVSX1NWTUUpKTsKCj8KCkphbgoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
