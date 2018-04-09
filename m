From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10] x86/altp2m: support for setting
 restrictions for an array of pages
Date: Mon, 09 Apr 2018 05:14:22 -0600
Message-ID: <5ACB672E02000078001B9866@prv1-mh.provo.novell.com>
References: <1513174940-6756-1-git-send-email-ppircalabu@bitdefender.com>
 <20180313174401.6axuxmdnsbu7evtz@citrix.com>
 <359baae6-1008-1128-13bf-121b01254ff1@bitdefender.com>
 <ec1c059d-f8be-ed44-47fb-9ea62bc616e5@citrix.com>
 <6dd22787-b9c5-79c1-c7b2-7b5b491d4ac6@bitdefender.com>
 <f7efdf8b-8c46-f19f-af2d-eafaf8b3ba83@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f7efdf8b-8c46-f19f-af2d-eafaf8b3ba83@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, tim@xen.org, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE4IGF0IDEyOjMyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMy8zMC8yMDE4IDExOjE0IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IE9u
IDAzLzMwLzIwMTggMDE6MDMgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiBJbiByZXNwb25z
ZSB0byB2OCwgSSBzYWlkOiAgIkZXSVcgdGhlIGFwcHJvYWNoIGxvb2tzIGdvb2QgdG8gbWUgaGVy
ZS4KPj4+IFlvdSBtYWlubHkgbmVlZCBhbiB4ODYgbWFpbnRhaW5lcidzIGFjayBhbmQgYSB0b29s
c3RhY2sgbWFpbnRhaW5lcidzCj4+PiBhY2sgKG9mIHdoaWNoIEkgYW0gbmVpdGhlcikuIgo+Pj4K
Pj4+IEknbSBub3QgYSBtYWludGFpbmVyIG9mIGB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jYCAtLSB0
aGF0J3MgQW5keSBhbmQgSmFuLgo+Pj4KPj4+IE9UT0gsIGFsdHAybSBpcyBhIHAybSBmZWF0dXJl
LCBzbyBhcmd1YWJseSBpdCBzaG91bGQgYmUgcHJpbWFyaWx5IG15Cj4+PiByZXNwb25zaWJpbGl0
eS4KPj4+Cj4+PiBBbnl3YXksIEknbGwgdGFrZSBhIGxvb2sgYXQgaXQgdG9kYXk7IGlmIEkgY2Fu
IGdpdmUgYSBSZXZpZXdlZC1ieSwgdGhlbgo+Pj4gbWF5YmUgd2UgY2FuIG5lZ290aWF0ZSBmb3Ig
aXQgdG8gZ28gaW4gd2l0aCBqdXN0IHRoYXQgKHdpdGggbXkgY29tbWl0dGVyCj4+PiBoYXQgb24g
b24pLCBvciBmb3IgQW5keSB0byBBY2sgaXQgYmFzZWQgbW9zdGx5IG9uIG15IFItYi4KPj4gCj4+
IFRoYW5rIHlvdSBmb3IgeW91ciBoZWxwISBBbmQgc29ycnkgaWYgSSd2ZSBtaXN0YWtlbmx5IG5h
bWVkIHlvdSBoZXJlLAo+PiBxdWl0ZSBwb3NzaWJseSBJJ3ZlIG1pc3VuZGVyc3Rvb2QgSmFuJ3Mg
ZWFybGllciByZXBseS4KPiAKPiBObywgeW91IHdlcmUgY2xlYXJseSB0YWtpbmcgYSBsZWFkIGZy
b20gSmFuIC0tIEknbSBub3Qgc3VyZSBleGFjdGx5IHdoYXQKPiBoZSBoYWQgaW4gbWluZCBieSBu
YW1pbmcgbWUgKGkuZS4sIHdpdGggdGhlIHN0cmljdCBydWxlcyBmb3Igd2hvIGhhcyB0bwo+IGFw
cHJvdmUgd2hhdCkuICBJIHdhcyBqdXN0IGV4cGxhaW5pbmcgd2h5IGl0IGRpZG4ndCBhbHJlYWR5
IGhhdmUgYW4gUi1iCj4gZnJvbSBtZS4gOi0pCgpXZWxsLCBJIGhhZCB5b3UgaW4gbWluZCB3aXRo
IHRoZSB0b3BpYyAoYWx0cDJtKSBpbiBtaW5kLCBhbG9uZ3NpZGUKdGhlIHN0cmljdCBmaWxlIGJh
c2VkIHJ1bGVzIHdoaWNoIHdvdWxkIGxpbWl0IGFja3MgdG8gQW5kcmV3IGFuZCBtZS4KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
