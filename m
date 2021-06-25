Return-Path: <SRS0=GDwr=LT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719DBC2B9F4
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 13:43:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2296E617ED
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 13:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2296E617ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147248.271279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwm6s-0000mn-DQ; Fri, 25 Jun 2021 13:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147248.271279; Fri, 25 Jun 2021 13:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwm6s-0000mg-AV; Fri, 25 Jun 2021 13:43:06 +0000
Received: by outflank-mailman (input) for mailman id 147248;
 Fri, 25 Jun 2021 13:43:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwm6q-0000mW-Oy
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:43:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwm6n-0003Sm-RO; Fri, 25 Jun 2021 13:43:01 +0000
Received: from [54.239.6.179] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwm6n-00060m-IA; Fri, 25 Jun 2021 13:43:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZXh8a3aIWYhJbddLkHhwqIiCYXl1FHEyu/rPyVgsIU8=; b=YjB2+xcLSSnCFZ1V3+rq9paXxH
	JhXWZPTfo/xFtkNcascFHnUJ1+yd5UfJ7lHnlqVrh03AC3s3CfIpQcYtbmI3aXRhIz3D2A8O3eIb3
	uImZFu9/j5ISaXaweTVjKQVNq5cpRhctz8rN6cmFY11qfTO9E7YfK22AuA9VbRkSweSw=;
Subject: Re: [PATCH] Replace FSF street address with canonical URL (again)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210625134140.19870-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <477386f0-3f02-c9f9-6f97-2facd84fee74@xen.org>
Date: Fri, 25 Jun 2021 15:42:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625134140.19870-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 25/06/2021 15:41, Andrew Cooper wrote:
> As recommended in http://www.gnu.org/licenses/gpl-howto.en.html.
> 
> Exactly as per changeset 443701ef0c7ff3 - Some errors have crept back in in
> the past 6 years.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>   tools/libs/guest/xg_dom_hvmloader.c | 3 +--
>   xen/arch/arm/acpi/boot.c            | 3 +--
>   xen/common/argo.c                   | 3 +--
>   xen/include/asm-arm/acpi.h          | 3 +--
>   xen/include/xen/argo.h              | 3 +--
>   xen/include/xen/rbtree.h            | 3 +--
>   xen/lib/rbtree.c                    | 3 +--
>   7 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
> index ae50d98011..39e1e5f579 100644
> --- a/tools/libs/guest/xg_dom_hvmloader.c
> +++ b/tools/libs/guest/xg_dom_hvmloader.c
> @@ -14,8 +14,7 @@
>    * Lesser General Public License for more details.
>    *
>    * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
>    *
>    */
>   
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index 7ea2990cb8..db5085e15d 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -19,8 +19,7 @@
>    *  GNU General Public License for more details.
>    *
>    *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, write to the Free Software
> - *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + *  along with this program; If not, see <http://www.gnu.org/licenses/>.
>    *
>    * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    */
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 49be715f63..eaea7ba888 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -12,8 +12,7 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
>   #include <xen/argo.h>
> diff --git a/xen/include/asm-arm/acpi.h b/xen/include/asm-arm/acpi.h
> index b52ae2d6ef..e53973e054 100644
> --- a/xen/include/asm-arm/acpi.h
> +++ b/xen/include/asm-arm/acpi.h
> @@ -14,8 +14,7 @@
>    *  GNU General Public License for more details.
>    *
>    *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, write to the Free Software
> - *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + *  along with this program; If not, see <http://www.gnu.org/licenses/>.
>    *
>    * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    */
> diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
> index 2ba7e5c0c0..fd4cfdd55c 100644
> --- a/xen/include/xen/argo.h
> +++ b/xen/include/xen/argo.h
> @@ -9,8 +9,7 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
>   #ifndef __XEN_ARGO_H__
> diff --git a/xen/include/xen/rbtree.h b/xen/include/xen/rbtree.h
> index 1b72590e4e..77bf57d4ab 100644
> --- a/xen/include/xen/rbtree.h
> +++ b/xen/include/xen/rbtree.h
> @@ -13,8 +13,7 @@
>     GNU General Public License for more details.
>   
>     You should have received a copy of the GNU General Public License
> -  along with this program; if not, write to the Free Software
> -  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> +  along with this program; If not, see <http://www.gnu.org/licenses/>.
>   
>     linux/include/linux/rbtree.h
>   
> diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
> index 95e045d524..85a4f20313 100644
> --- a/xen/lib/rbtree.c
> +++ b/xen/lib/rbtree.c
> @@ -15,8 +15,7 @@
>     GNU General Public License for more details.
>   
>     You should have received a copy of the GNU General Public License
> -  along with this program; if not, write to the Free Software
> -  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> +  along with this program; If not, see <http://www.gnu.org/licenses/>.
>   
>     linux/lib/rbtree.c
>   */
> 

-- 
Julien Grall

