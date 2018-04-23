From: "Natarajan, Janakarajan" <jnataraj@amd.com>
Subject: Re: [PATCH 2/8] x86/HVM/SVM: Add AVIC initialization
 code
Date: Mon, 23 Apr 2018 15:26:24 -0500
Message-ID: <7a2871d3-a898-a7c0-0bc8-fe5959d8c4f4@amd.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <25d739b732adb329166f7cca3633473f4ad08b39.1522794651.git.Janakarajan.Natarajan@amd.com>
 <20180423193318.GE30033@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180423193318.GE30033@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8yMDE4IDI6MzMgUE0sIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPj4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9zdm0vYXZpYy5jCj4+IEBAIC0wLDAgKzEsMTkxIEBACj4+ICsv
Kgo+PiArICogYXZpYy5jOiBpbXBsZW1lbnRzIEFNRCBBZHZhbmNlZCBWaXJ0dWFsIEludGVycnVw
dCBDb250cm9sbGVyIChBVklDKSBzdXBwb3J0Cj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTYsIEFk
dmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KPiBOb3QgMjAxOD8KCkFoIGdvb2QgY2F0Y2guIFll
YWggaXQgc2hvdWxkIGJlIDIwMTguCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
